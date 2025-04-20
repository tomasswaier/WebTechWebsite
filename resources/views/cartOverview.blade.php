<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=close" />
  <title>Cart - overview</title>
    @vite('resources/css/app.css')

</head>

<body class="h-screen grid grid-cols-1 justify-between">
  <header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
    <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
      <img src="icons/logo.png" alt="logo" class="h-full">
    </a>
    <button id="hamburger_btn" type="button" data-collapse-toggle="hamburger_default" aria-controls="hamburger_default" aria-expanded="false" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200">
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
  <main>
    <div class="container mx-auto px-4 py-4">
      <ul class="grid grid-cols-3 w-fit gap-10 py-10">
        <li class="font-bold">1 • Overview</li>
        <li>2 • Address</li>
        <li>3 • Shipping & Payment</li>
      </ul>
      <div id="main_cart_section" class="grid grid-flow-row sm:grid-flow-col w-full">
        <div id="products_section" class="grid grid-flow-row w-full md:w-[50vw]">
          <h2 class="my-3 font-bold">Your Cart</h2>
          <ul class="grid w-auto grid-flow-row gap-y-4">
            <li class="grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start justify-center sm:justify-normal border-b sm:border-none">
              <img src="product_images/example_shirt_front.png" alt="img1" class="w-auto max-h-30 sm:max-h-15">
              <span>Meow T-shirt</span>
              <span>$28.00</span>
              <span>Size: L</span>
              <input type="number" class="w-15 border border-black rounded-lg text-center" placeholder="1" required>
              <button type="button" class="hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer">
                <span class="material-symbols-outlined">close</span>
              </button>
            </li>
            <li class="grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start justify-center sm:justify-normal border-b sm:border-none">
              <img src="product_images/example_shirt_front_white.png" alt="img1" class="w-auto max-h-30 sm:max-h-15">
              <span>Meow T-shirt</span>
              <span>$28.00</span>
              <span>Size: L</span>
              <input type="number" class="w-15 border border-black rounded-lg text-center" placeholder="1" required>
              <button type="button" class="hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer">
                <span class="material-symbols-outlined">close</span>
              </button>
            </li>
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
