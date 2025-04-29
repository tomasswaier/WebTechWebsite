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
          @csrf
          <label for="shipping_info" class="font-bold text-lg mb-2">Shipping information</label>
          <div id="name_input_group" class="flex flex-col md:flex-row justify-between w-full md:space-x-2 space-y-3 md:space-y-0">
            <input name="first_name" placeholder="First name" class="w-full border border-gray-400 rounded-md p-1" required>
            <input name="last_name" placeholder="Last name" class="w-full border border-gray-400 rounded-md p-1" required>
          </div>
          <input name="address" placeholder="Address" class="w-full border border-gray-400 rounded-md p-1" required>
          <input name="country" placeholder="Country" class="w-full border border-gray-400 rounded-md p-1" required>
          <input name="city" placeholder="City" class="w-full border border-gray-400 rounded-md p-1" required>
          <input name="zipcode" placeholder="Zipcode" class="w-full border border-gray-400 rounded-md p-1" required>

          <button type="button" onclick="handleRedirect()" class="w-full bg-black rounded-xl text-white py-2.5 hover:cursor-pointer">
            Continue to Shipping & Payment
          </button>
        </form>

      <div id="products_section" class="grid grid-flow-row w-auto">
        <label for="order_summary" class="font-bold text-lg mb-2">
          Order summary
        </label>

            <ul id="order_summary" class="grid grid-flow-row w-auto gap-y-4">
              @foreach ($products as $product)
                <li class="flex flex-row w-full items-center justify-normal">
                  <img src="{{ asset('product_images/' . $product->images->firstWhere('is_main', true)?->image_url ?? 'default.png') }}" alt="{{ $product->name }}" class="w-auto max-h-16">
                  <div class="grid grid-flow-row sm:grid-flow-col items-center justify-between w-full ml-5">
                    <span class="font-bold">{{ $product->name }}</span>
                    <span>Size: {{ $product->size }}</span>
                    <span>Quantity: {{ $product->quantity }}</span>
                    <span>${{ number_format($product->price, 2) }}</span>
                  </div>
                </li>
              @endforeach

              <li class="flex flex-row w-full justify-between">
                <span>Total:</span>
                <span id="total_price">${{ number_format($total, 2) }}</span>
              </li>
              <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
            </ul>

      </div>

    </div>
  </main>
  <script>
  function handleRedirect() {
    const form = document.getElementById('shipping_info');

    if (form.checkValidity()) {
      window.location.href = "{{ url('/cartPayment') }}";
    } else {
      // This will trigger native HTML5 validation error messages
      form.reportValidity();
    }
  }
</script>

@vite('resources/js/displayCartItems.js')
@vite('resources/js/responsiveHeader.js')
@endsection
