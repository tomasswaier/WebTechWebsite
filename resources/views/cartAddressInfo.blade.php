@extends('layouts.app')

@section('main_content')
  <main class="container mx-auto px-4 py-4">
    <ul class="grid grid-cols-3 w-fit gap-10 py-10">
      <li>1 • Overview</li>
      <li class="font-bold">2 • Address</li>
      <li>3 • Shipping & Payment</li>
    </ul>

    <div id="main_cart_section" class="grid grid-cols-1 grid-rows-2 md:grid-cols-2 md:grid-rows-1 w-full gap-10">
      <form id="shipping_info" method="post" action="#" class="grid grid-cols-1 w-full space-y-3">
        <label for="shipping_info" class="font-bold text-lg mb-2">Shipping information</label>
        <div id="name_input_group" class="flex flex-col md:flex-row justify-between w-full md:space-x-2 space-y-3 md:space-y-0">
          <input name="first_name" placeholder="First name" class="w-full border border-gray-400 rounded-md p-1" required>
          <input name="last_name" placeholder="Last name" class="w-full border border-gray-400 rounded-md p-1" required>
        </div>
        <input name="address" placeholder="Address" class="w-full border border-gray-400 rounded-md p-1" required>
        <input name="country" placeholder="Country" class="w-full border border-gray-400 rounded-md p-1" required>
        <input name="city" placeholder="City" class=" w-full border border-gray-400 rounded-md p-1" required>
        <input name="zipcode" placeholder="Zipcode" class=" w-full border border-gray-400 rounded-md p-1" required>
        <a href="{{url('/cartPayment')}}" class="w-full bg-black rounded-xl text-white py-2.5 hover:cursor-pointer">
          Continue to Shipping & Payment
        </a>

      </form>
      <div id="products_section" class="grid grid-flow-row w-auto">
        <label for="order_summary" class="font-bold text-lg mb-2">
          Order summary
        </label>
        <ul id="order_summary" class="grid grid-flow-row w-auto gap-y-4">
          <li class="flex flex-row w-full items-center justify-normal">
            <img src="product_images/example_shirt_front.png" alt="img1" class="w-auto max-h-16">
            <div class="grid grid-flow-row sm:grid-flow-col items-center justify-between w-full ml-5">
              <span class="font-bold">Meow T-shirt</span>
              <span>Size: L</span>
              <span>Quantity: 1</span>
              <span>$28.00</span>
            </div>
          </li>
          <li class="flex flex-row w-full items-center justify-normal">
            <img src="product_images/example_shirt_front_white.png" alt="img1" class="w-auto max-h-16">
            <div class="grid grid-flow-row sm:grid-flow-col items-center justify-between w-full ml-5">
              <span class="font-bold">Meow T-shirt</span>
              <span>Size: L</span>
              <span>Quantity: 1</span>
              <span>$28.00</span>
            </div>
          </li>
          <li class="flex flex-row w-full justify-between">
            <span>Total:</span>
            <span id="total_price">$56.00</span>
          </li>
          <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
        </ul>
      </div>

    </div>
  </main>
@vite('resources/js/responsiveHeader.js')
@endsection
