<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=menu" />
  <title>cart - shipping & payment</title>
    @vite('resources/css/app.css')

</head>

<body class="min-h-screen h-screen grid grid-cols-1 justify-between">
  <header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
    <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
      <img src="icons/logo.png" alt="logo" class="h-full">
    </a>
    <button id="hamburger_btn" type="button" data-collapse-toggle="hamburger_default" aria-controls="hamburger_default" aria-expanded="false" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
      <span class="sr-only">Open main menu</span>
      <img src="icons/hamburgerIcon.png" alt="hamburger icon" class="max-h-12 md:mb-0">
    </button>
    <div id="hamburger_default" class="absolute hidden bg-white mt-5 md:mt-0 top-full right-0 w-full z-50 md:static md:flex md:w-auto md:mr-3">
      <ul class="flex flex-col z-50 md:flex-row space-y-3 md:space-y-0 p-4 md:p-0 bg-white border border-gray-500 md:mt-0 md:border-0 md:bg-white md:space-x-2">
        <li class="relative block">
          <form method="post" action="#">
            <input type="search" name="search_query" placeholder="Search.." class="block ml-auto w-full md:w-96 rounded-lg border-black border p-1 focus:outline-none pl-5">
            <button type="submit" class="absolute top-0 z-20 end-0 rounded-e-lg bg-black p-2 focus:ring-1 border border-black">
              <img src="icons/search.png" alt="search-icon" class="w-4 h-4">
            </button>
          </form>
        </li>
        <li class="block">
          <a href="{{ url('cartOverview')}}" class="flex w-full justify-center space-x-3 md:space-x-0 border md:border-transparent bg-white md:bg-transparent border-black rounded-lg">
            <img src="icons/shoppingCart.png" alt="shopping cart icon" class="max-h-10 mb-2 md:mb-0">
            <span class="flex md:hidden self-center">Cart</span>
          </a>
        </li>
        <li class="block">
          <a href="{{ url('logInPage')}}"><button type="button" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log
              in</button></a>
        </li>
        <li class="block">
          <a href="{{ url('registerPage')}}"><button type="button" class="w-full md:w-20 h-10 bg-black text-white active:bg-neutral-500 rounded-lg">Register</button></a>
        </li>
      </ul>

    </div>
  </header>
  <main class="container mx-auto px-4 py-4">
    <ul class="grid grid-cols-3 w-fit gap-10 py-10">
      <li>1 • Overview</li>
      <li>2 • Address</li>
      <li class="font-bold">3 • Shipping & Payment</li>
    </ul>

    <div id="main_cart_section" class="w-fit grid grid-cols-1 grid-rows-2 md:grid-cols-2 md:grid-rows-1 w-full gap-10">
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
            <img src="product_images/example_shirt_front.png" alt="img1" class="w-auto max-h-15">
            <div class="grid grid-flow-row sm:grid-flow-col items-center justify-between w-full ml-5">
              <span class="font-bold">Meow T-shirt</span>
              <span>Size: L</span>
              <span>Quantity: 1</span>
              <span>$28.00</span>
            </div>
          </li>
          <li class="flex flex-row w-full items-center justify-normal">
            <img src="product_images/example_shirt_front_white.png" alt="img1" class="w-auto max-h-15">
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
  </main>
  <footer class="w-full h-28 bottom-0 mt-auto">
    <hr>
    <div class='relative top-10 grid mx-auto grid-flow-col align-middle w-fit space-x-5'>
      <span>Contact</span>
      <span>FAQ</span>
      <span>c all rights reserved</span>
    </div>
  </footer>
</body>
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
<script src='responsiveHeader.js'>
</script>


</html>
