@extends('layouts.app')

@section('main_content')
    <div class="container mx-auto px-4 py-4">
      <ul class="grid grid-cols-3 w-fit gap-10 py-10">
        <li class="font-bold">1 • Overview</li>
        <li>2 • Address</li>
        <li>3 • Shipping & Payment</li>
      </ul>
      <div id="main_cart_section" class="grid grid-flow-row sm:grid-flow-col w-full">
        <div id="products_section" class="grid grid-flow-row w-full md:w-[50vw]">
          <h2 class="my-3 font-bold">Your Cart</h2>
            <ul id="itemCartContainer" class="grid w-auto grid-flow-row gap-y-4">
                @if(!empty($products))
                    @foreach($products as $product)
                        <li class="grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start sm:justify-normal border-b sm:border-none">
                            <img src="{{ asset('product_images/' . $product->images->firstWhere('is_main', true)->image_url)}}" alt="{{$product->name}}" class="w-auto max-h-32 sm:max-h-16">
                            <span>{{ $product->name }}</span>
                            <span>@if($product->price == $product->discounted_price) ${{ number_format($product->price, 2) }} @else ${{ number_format($product->discounted_price, 2) }} @endif</span>
                            <span>Size: {{ $product->size }}</span>
                            <form method="post" action="{{route('cart.change', ['product_id' => $product->id])}}" class="flex">
                                @csrf
                                <button type="submit" class="btn btn-link px-2 border rounded-s-lg border-black"
                                        onclick="this.parentNode.querySelector('input[type=number]').value = parseInt(this.parentNode.querySelector('input[type=number]').value) - 1;"><b>&minus;</b></button>
                                <input type="hidden" name="size" value="{{ $product->size }}">
                                <input type="number" name="quantity" min="0" value="{{ $product->quantity }}" class="w-12 border-x-transparent border border-black text-center">
                                <button type="submit" class="btn btn-link px-2 border rounded-e-lg border-black"
                                        onclick="this.parentNode.querySelector('input[type=number]').value = parseInt(this.parentNode.querySelector('input[type=number]').value) + 1;"><b>&plus;</b></button>
                            </form>
                            <form action="{{route('cart.delete', ['product_id' => $product->id])}}" method="POST">
                                @csrf
                                <input type="hidden" name="size" value="{{ $product->size }}">
                                <button type="submit" class="hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer text-2xl">
                                    &times;
                                </button>
                            </form>
                        </li>
                    @endforeach
                @else
                    <span class="text-xl">Your cart is currently empty! You can <a class="underline" href="/allProducts">continue shopping here.</a></span>
                @endif

            </ul>
        </div>
        <div id="order_summary" class="mx-5 grid grid-flow-row w-auto">
          <h2 class="font-bold my-3">Order Summary</h2>
          <div class="grid grid-flow-col justify-between">
            <span>Total:</span>
            <span id="total_price">${{$total}}</span>
          </div>
          <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
          <a href="{{url('cartAddressInfo')}}" class="w-full bg-black grid align-middle justify-center rounded-xl text-white py-2.5 hover:cursor-pointer">
            Continue to checkout
          </a>
        </div>
      </div>
    </div>
    </div>
@vite('resources/js/displayCartItems.js')
@vite('resources/js/responsiveHeader.js')
@endsection
