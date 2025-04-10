<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=close" />
  <title>cart - address info</title>
</head>

<body class="h-screen grid grid-cols-1 justify-between">
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
          <a href="#" class="flex w-full justify-center space-x-3 md:space-x-0 border md:border-transparent bg-white md:bg-transparent border-black rounded-lg">
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
        <button type="submit" class="w-full bg-black rounded-xl text-white py-2.5 hover:cursor-pointer">
          Continue to Shipping & Payment
        </button>
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
<script src='responsiveHeader.js'>
</script>

</html>
