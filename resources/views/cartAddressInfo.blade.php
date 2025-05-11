@extends('layouts.app')

@section('main_content')
  <main class="container w-full mx-auto px-5 py-5">
    <ul class="grid grid-cols-3 w-fit gap-10 py-10">
      <li>1 • Overview</li>
      <li class="font-bold">2 • Address</li>
      <li>3 • Shipping & Payment</li>
    </ul>

    <section id="main_cart_section" class="grid grid-cols-1 grid-rows-2 md:grid-cols-2 md:grid-rows-1 w-full gap-10">

        <form id="shipping_info" method="post" action="{{route('cart.save_address')}}" class="grid grid-cols-1 w-full space-y-3">
          @csrf
          <label for="shipping_info" class="font-bold text-lg mb-2">Shipping information</label>
          <div id="name_input_group" class="grid grid-flow-row md:grid-cols-2 w-full md:space-x-2 space-y-3 md:space-y-0">
              <div class="block">
                  <input name="first_name" placeholder="First name" class="w-full border border-gray-400 rounded-md p-2" required>
                  @error('first_name')
                    <p class="text-red-600 text-sm">{{ $message }}</p>
                  @enderror
              </div>
              <div class="block">
                  <input name="last_name" placeholder="Last name" class="w-full border border-gray-400 rounded-md p-2" required>
                  @error('last_name')
                  <p class="text-red-600 text-sm">{{ $message }}</p>
                  @enderror
              </div>
          </div>
            <div class="block">
                <input name="email" placeholder="E-mail" class="w-full border border-gray-400 rounded-md p-2" required>
                @error('email')
                <p class="text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>
            <div class="block">
                <input name="address" placeholder="Address" class="w-full border border-gray-400 rounded-md p-2" required>
                @error('address')
                <p class="text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>
            <div>
                <input name="country" placeholder="Country" class="w-full border border-gray-400 rounded-md p-2" required>
                @error('country')
                <p class="text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>
            <div class="grid md:grid-cols-3 md:gap-2 grid-flow-row gap-y-2">
                <div class="block md:col-span-2">
                    <input name="city" placeholder="City" class="w-full border border-gray-400 rounded-md p-2" required>
                    @error('city')
                    <p class="text-red-600 text-sm">{{ $message }}</p>
                    @enderror
                </div>
                <div class="block">
                    <input name="zipcode" placeholder="Zipcode" class="w-full border border-gray-400 rounded-md p-2" required>
                    @error('zipcode')
                    <p class="text-red-600 text-sm">{{ $message }}</p>
                    @enderror
                </div>
            </div>
          <button type="submit" class="w-full bg-black rounded-xl text-white py-2.5 hover:cursor-pointer">
            Continue to Shipping & Payment
          </button>
        </form>

      <section id="products_section" class="grid grid-flow-row w-auto content-start gap-y-3">
        <label for="order_summary" class="font-bold text-lg mb-2">
          Order summary
        </label>

            <ul id="order_summary" class="grid grid-flow-row w-auto gap-y-4">
              @foreach ($products as $product)
                <li class="flex flex-row w-full items-center justify-normal">
                  <img src="{{ asset('product_images/' . $product->images->firstWhere('is_main', true)?->image_url ?? 'default.png') }}" alt="{{ $product->name }}" class="w-auto max-h-16">
                  <div class="grid grid-flow-row sm:grid-cols-4 items-center place-items-end w-full ml-5">
                    <span class="font-bold">{{ $product->name }}</span>
                    <span>Size: {{ $product->size }}</span>
                    <span>Quantity: {{ $product->quantity }}</span>
                    <span>@if(!$product->discounted_price || $product->price == $product->discounted_price) ${{ number_format($product->price * $product->quantity, 2) }} @else ${{ number_format($product->discounted_price * $product->quantity, 2) }} @endif</span>
                  </div>
            </li>
              @endforeach
                  <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
                  <li class="flex flex-row w-full justify-between">
                    <span>Total:</span>
                    <span id="total_price">${{ number_format($total, 2) }}</span>
                  </li>
            </ul>

      </section>

    </section>
  </main>

@vite('resources/js/displayCartItems.js')
@vite('resources/js/responsiveHeader.js')
@endsection
