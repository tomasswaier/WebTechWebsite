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
            <!--<li class="grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start justify-center sm:justify-normal border-b sm:border-none">
              <img src="product_images/example_shirt_front.png" alt="img1" class="w-auto max-h-32 sm:max-h-16">
              <span>Meow T-shirt</span>
              <span>$28.00</span>
              <span>Size: L</span>
              <input type="number" class="w-15 border border-black rounded-lg text-center" placeholder="1" required>
              <button type="button" class="hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer">
                <span class="material-symbols-outlined">close</span>
              </button>
            </li>
            <li class="grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start justify-center sm:justify-normal border-b sm:border-none">
              <img src="product_images/example_shirt_front_white.png" alt="img1" class="w-auto max-h-32 sm:max-h-16">
              <span>Meow T-shirt</span>
              <span>$28.00</span>
              <span>Size: L</span>
              <input type="number" class="w-15 border border-black rounded-lg text-center" placeholder="1" required>
              <button type="button" class="hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer">
                <span class="material-symbols-outlined">close</span>
              </button>
            </li> -->
          </ul>
        </div>
        <div id="order_summary" class="grid grid-flow-row w-auto">
          <h2 class="font-bold my-3">Order Summary</h2>
          <div class="grid grid-flow-col justify-between">
            <span>Total:</span>
            <span id="total_price">$56.00</span>
          </div>
          <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
          <button class="w-full bg-black rounded-xl text-white py-2.5 hover:cursor-pointer">
            Continue to checkout
          </button>
        </div>
      </div>
    </div>
    </div>
@vite('resources/js/displayCartItems.js')
@vite('resources/js/responsiveHeader.js')
<script>
        document.addEventListener("DOMContentLoaded", () => {
            loadCartContents('itemCartContainer', 3);
        });
    </script>

@endsection
