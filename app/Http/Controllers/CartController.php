<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;


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
        return redirect()->back()->with('success', 'You added to cart successfully!');
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
                $cart->products()->wherePivot('product_id', $productId)->wherePivot('size', $request['size'])->update(['quantity' => $request['quantity']]);
            }

        }
        return redirect()->back();

    }
}
