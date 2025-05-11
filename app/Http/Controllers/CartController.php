<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\OrderProduct;
use App\Models\Orders;
use App\Models\PaymentDetails;
use App\Models\Products;
use App\Models\Shipping;
use App\Models\ShippingDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use JetBrains\PhpStorm\NoReturn;


class CartController extends Controller
{
    public function add($productId, Request $request)
    {
        $product = Products::query()->find($productId);
        $quantity = $request->quantity;
        $size = $request->size;

        if ($request->user() == null) {
            $cart = Session::get('cart', []);
            $key = $product->id . '_' . $size;

            if (isset($cart[$key])) {
                $cart[$key]['quantity'] += $quantity;
            }
            else {
                $cart[$key] = [
                    'product_id' => $product->id,
                    'quantity' => $quantity,
                    'size' => $size,
                ];
            }
            Session::put('cart', $cart);
        } else {
            $user = $request->user();
            $cart = $user->cart;

            if (!$cart) {
                $cart = $user->cart()->create();
            }
            if ($user->cart == null) {
                DB::table('carts')->insert([
                    'user_id' => $user->id,
                ]);
                $cart = Cart::where('user_id', $user->id)->get();
                $user->cart = $cart;
            }
            $thisProduct = $cart->products()->where('product_id', $product->id)->wherePivot('size', $size)->first();

            if ($thisProduct) {
                $cart->products()->updateExistingPivot($thisProduct->id, ['quantity' => $thisProduct->pivot->quantity + $quantity, 'size' => $size]);
            } else {
                $cart->products()->attach($productId, [
                    'id' => Str::uuid(),
                    'quantity' => $quantity,
                    'size' => $size,
                ]);
            }
        }
        return redirect()->back()->with('success', 'You added product to cart successfully!');
    }

    public function overview(Request $request) {

        $total = 0;
        $products = [];

        if (!$request->user()) {
            $cart = Session::get('cart', []);

            foreach ($cart as $key => $item) {
                $product = Products::with(['images'])->find($item['product_id']);

                if ($product) {
                    $product->quantity = $item['quantity'];
                    $product->size = $item['size'];
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item['quantity'];
                    } else {
                        $product->subtotal = $product->discounted_price * $item['quantity'];
                    }

                    $total += $product->subtotal;

                    $products[] = $product;
                }
            }
        } else {
            $user = $request->user();

            $cart = $user->cart()->with(['products'])->first();
            foreach ($cart->products as $item) {
                $product = Products::with(['images'])->find($item->pivot->product_id);
                if ($product) {
                    $product->quantity = $item->pivot->quantity;
                    $product->size = $item->pivot->size;
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item->pivot->quantity;
                    } else {
                        $product->subtotal = $product->discounted_price * $item->pivot->quantity;
                    }
                    $total += $product->subtotal;
                    $products[] = $product;
                }
            }
        }

        return view('cartOverview', [
            'products' => $products,
            'total' => $total,
        ]);

    }

    public function delete($productId, Request $request) {

        $size = $request['size'];

        if (!$request->user()) {
            $cart = Session::get('cart', []);

            $key = $productId . '_' . $size;

            if (isset($cart[$key])) {
                unset($cart[$key]);
                Session::put('cart', $cart);
            }
        } else {
            $user = $request->user();

            $cart = $user->cart;
            $cart->products()->wherePivot('product_id', $productId)->wherePivot('size', $size)->detach($productId);
        }

        return redirect()->back();
    }

    public function change($productId, Request $request)
    {
        if ($request->user() == null) {
            $cart = Session::get('cart', []);
            $key = $productId . '_' . $request['size'];
            if(isset($cart[$key])) {
                if ($request['quantity'] == 0) {
                    unset($cart[$key]);
                } else {
                    $cart[$key]['quantity'] = $request['quantity'];
                }
                Session::put('cart', $cart);
            }
        } else {
            $user = $request->user();
            $cart = $user->cart;
            if ($request['quantity'] == 0) {
                $cart->products()->wherePivot('product_id', $productId)->wherePivot('size', $request['size'])->detach($productId);
            } else {
                $cart->products()->updateExistingPivot($productId, ['quantity' => $request['quantity']]);
            }

        }
        return redirect()->back();

    }

    public function address_info(Request $request)
    {
        $total = 0;
        $products = [];

        if (!$request->user()) {
            $cart = Session::get('cart', []);

            foreach ($cart as $key => $item) {
                $product = Products::with(['images'])->find($item['product_id']);

                if ($product) {
                    $product->quantity = $item['quantity'];
                    $product->size = $item['size'];
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item['quantity'];
                    } else {
                        $product->subtotal = $product->discounted_price * $item['quantity'];
                    }

                    $total += $product->subtotal;

                    $products[] = $product;
                }
            }
        } else {
            $user = $request->user();

            $cart = $user->cart()->with(['products'])->first();
            foreach ($cart->products as $item) {
                $product = Products::with(['images'])->find($item->pivot->product_id);
                if ($product) {
                    $product->quantity = $item->pivot->quantity;
                    $product->size = $item->pivot->size;
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item->pivot->quantity;
                    } else {
                        $product->subtotal = $product->discounted_price * $item->pivot->quantity;
                    }
                    $total += $product->subtotal;
                    $products[] = $product;
                }
            }
        }

        return view('cartAddressInfo', [
            'products' => $products,
            'total' => $total,
        ]);
    }

    public function save_address(Request $request)
    {
        /*email validation*/
        $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => ['required', 'email:rfc,dns'],
            'address' => 'required',
            'city' => 'required',
            'zipcode' => ['required', 'max:5'],
            'country' => 'required',
        ]);

//        dd($validatedForm);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $address = [
                'first_name' => $request['first_name'],
                'last_name' => $request['last_name'],
                'address' => $request['address'],
                'city' => $request['city'],
                'zipcode' => $request['zipcode'],
                'country' => $request['country'],
            ];

            Session::put('address', $address);

            return redirect(route('cart.payment'));
        }

    }

    public function payment(Request $request) {

        $total = 0;
        $products = [];

        if (!$request->user()) {
            $cart = Session::get('cart', []);

            foreach ($cart as $key => $item) {
                $product = Products::with(['images'])->find($item['product_id']);

                if ($product) {
                    $product->quantity = $item['quantity'];
                    $product->size = $item['size'];
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item['quantity'];
                    } else {
                        $product->subtotal = $product->discounted_price * $item['quantity'];
                    }

                    $total += $product->subtotal;

                    $products[] = $product;
                }
            }
        } else {
            $user = $request->user();

            $cart = $user->cart()->with(['products'])->first();
            foreach ($cart->products as $item) {
                $product = Products::with(['images'])->find($item->pivot->product_id);
                if ($product) {
                    $product->quantity = $item->pivot->quantity;
                    $product->size = $item->pivot->size;
                    if ($product->discounted_price == $product->price) {
                        $product->subtotal = $product->price * $item->pivot->quantity;
                    } else {
                        $product->subtotal = $product->discounted_price * $item->pivot->quantity;
                    }
                    $total += $product->subtotal;
                    $products[] = $product;
                }
            }
        }

        $shipping_methods = Shipping::all();

        return view('cartPayment', [
            'products' => $products,
            'total' => $total,
            'shipping_methods' => $shipping_methods,
        ]);

    }

    public function confirm_order(Request $request)
    {
        if ($request['payment_method'] == 'method_cash') {
            $validator = Validator::make($request->all(), [
                'shipping_method' => 'required',
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'shipping_method' => 'required',
                'cardholder' => 'required',
                'card_number' => ['required', 'regex:/^[0-9]{4}\s?[0-9]{4}\s?[0-9]{4}\s?[0-9]{4}$/'],
                'expiration_date' => 'required|date_format:m/d',
                'cvc' => ['required', 'digits:3'],
            ]);
        }

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $shipping_method = Shipping::where('name', $request['shipping_method'])->first();
            if ($request['payment_method'] == 'method_cash') {
                $payment_method = PaymentDetails::where('payment_method', 'CASH')->first();
            } else {
                $payment_method = PaymentDetails::where('payment_method', 'CARD')->first();
            }

            $address = Session::get('address');

            if (!$request->user()) {
                $shipping_details = ShippingDetails::create([
                    'first_name' => $address['first_name'],
                    'last_name' => $address['last_name'],
                    'address' => $address['address'],
                    'city' => $address['city'],
                    'zip' => $address['zipcode'],
                ]);

                $order = Orders::create([
                   'shipping_method' => $shipping_method->id,
                   'payment_method' => $payment_method->id,
                   'shipping_details' => $shipping_details->id,
                   'price' => $request['total'] + $shipping_method->price,
                ]);

                $cart = Session::get('cart', []);
                foreach ($cart as $key => $item) {
                    $product = Products::find($item['product_id']);
                    if ($product) {
                        OrderProduct::create([
                            'order_id' => $order->id,
                            'product_id' => $product->id,
                            'quantity' => $item['quantity'],
                        ]);
                    }
                }

                Session::forget('cart');


            } else {
                $shipping_details = ShippingDetails::create([
                    'user_id' => $request->user()->id,
                    'first_name' => $address['first_name'],
                    'last_name' => $address['last_name'],
                    'address' => $address['address'],
                    'city' => $address['city'],
                    'zip' => $address['zipcode'],
                ]);

                $order = Orders::create([
                    'user_id' => $request->user()->id,
                    'shipping_method' => $shipping_method->id,
                    'payment_method' => $payment_method->id,
                    'shipping_details' => $shipping_details->id,
                    'price' => $request['total'] + $shipping_method->price,
                ]);

                $cart = $request->user()->cart()->with(['products'])->first();

                foreach ($cart->products as $item) {
                    $product = Products::find($item->pivot->product_id);
                    if ($product) {
                        // Insert into OrdersProducts table
                        OrderProduct::create([
                            'order_id' => $order->id,
                            'product_id' => $product->id,
                            'quantity' => $item->pivot->quantity,
                        ]);
                    }
                }

                $cart->products()->detach();
            }

            Session::forget('address');

            return redirect()->route('cart.payment')->with('success', 'Order has been successufully placed!');


        }

    }

}
