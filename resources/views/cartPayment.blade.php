@extends('layouts.app')

@section('main_content')
<div class="p-10">
    <ul class="grid grid-cols-3 w-fit gap-10 py-10">
      <li>1 • Overview</li>
      <li>2 • Address</li>
      <li class="font-bold">3 • Shipping & Payment</li>
    </ul>

    <div id="main_cart_section" class="grid grid-cols-1 grid-rows-2 md:grid-cols-2 md:grid-rows-1 w-full gap-10">
      <form method="post" action="#" class="grid grid-flow-row w-full">
        <label for="shipping_choice" class="font-bold text-lg mb-2">Select Shipping</label>
        <div id="shipping_choice" class="grid h-fit grid-flow-row space-y-2">
          <div class="items-center space-x-2">
            <input id="sps" name="shipping_method" value="sps" type="radio" class="bg-black border-gray-400 text-white accent-black">
            <label for="sps">SPS - $3.00</label>
          </div>
          <div class="items-center space-x-2">
            <input id="gls" name="shipping_method" value="gls" type="radio" class="bg-black border-gray-400 text-white accent-black">
            <label for="gls">GLS - $4.00</label>
          </div>

        </div>
        <label for="payment_info" class="font-bold text-lg mb-2">Payment details</label>
        <div id="payment_methods" class="grid grid-cols-1 sm:grid-cols-2 sm:gap-x-3 size-fit gap-y-3 h-fit mb-3">
          <div id="cash_payment" class="border border-black rounded-md sm:size-fit  w-full p-2">
            <input name="payment_method" id="cash_method" value="method_cash" type="radio" class="border border-black mr-2" checked="checked" onchange="cashPayment()" required>
            <label for="cash_method">Cash on delivery</label>
          </div>
          <div id="card_payment" class="border border-black rounded-md sm:size-fit w-full p-2">
            <input name="payment_method" id="card_method" value="method_card" type="radio" class="border border-black mr-2" onchange="cardPayment()" required>
            <label for="card_method">Credit card</label>
          </div>
        </div>
        <div id="payment_info" class="grid grid-cols-1 w-full space-y-2 hidden">
          <input name="cardholder" placeholder="Cardholder name" class="w-full border border-gray-400 rounded-md p-1" required>
          <input name="card_number" placeholder="Card number" class="w-full border border-gray-400 rounded-md p-1" required>
          <div id="card_info_group" class="flex flex-col sm:flex-row justify-between sm:gap-x-2 h-fit w-full space-y-3 sm:gap-y-0">
            <input name="expiration_date" placeholder="Expiration date" class="w-full h-fit border border-gray-400 rounded-md p-1" required>
            <input name="cvc" placeholder="CVC" class="w-full h-fit border border-gray-400 rounded-md p-1" required>
          </div>
          <button type="submit" class="w-full bg-black rounded-lg text-white py-2.5 hover:cursor-pointer">
            Pay with Card
          </button>
        </div>
        <div id="order_btn" class="grid grid-flow-row w-full">
          <button type="submit" class="w-full bg-black rounded-lg text-white py-2 hover:cursor-pointer">
            Place the order
          </button>
        </div>

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
            <span>Subtotal:</span>
            <span id="subtotal">$56.00</span>
          </li>
          <!--Place for shipping price-->
          <li id="shipping_price" class="flex flex-row w-full justify-between hidden">

          </li>
          <li class="flex flex-row w-full justify-between">
            <span>Total:</span>
            <span id="total_price">$56.00</span>
          </li>
          <hr class="my-3 w-full h-0.5 border-t-0 bg-gray-300" />
        </ul>
      </div>

    </div>
    </div>
    </div>
<script>
  const shippingChoices = document.querySelector("#shipping_choice");
  const shippingInputs = shippingChoices.querySelectorAll("input");
  const shippingPrice = document.querySelector("#shipping_price");
  const subtotal = parseFloat(document.querySelector("#subtotal").textContent.replace('$', ''))
  let totalPrice = document.querySelector("#total_price");
  const cardInfo = document.querySelector("#payment_info");
  const orderBtn = document.querySelector("#order_btn");

  function formatCurrency(number) {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD"
    }).format(number);
  }

  shippingInputs.forEach(input => {
    input.addEventListener("change", ev => {
      const shippingPriceValue = ev.target.value === "sps" ? 3 : 4;
      shippingInputs.forEach(i => {
        if (i !== ev.target) {
          i.checked = false;
          shippingPrice.style.display = "flex";
          shippingPrice.innerHTML = `
                        <label for="shipping_price">Shipping:</label>
                        <span id="shipping_price">${formatCurrency(shippingPriceValue)}</span>
                    `;
          totalPrice.innerHTML = `${formatCurrency(subtotal + shippingPriceValue)}`
        }
      });
    });
  });

  function cardPayment() {
    orderBtn.style.display = "none";
    cardInfo.style.display = "grid";
  }

  function cashPayment() {
    orderBtn.style.display = "grid";
    cardInfo.style.display = "none";
  }
</script>
@vite('resources/js/responsiveHeader.js')
@endsection
