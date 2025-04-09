<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <meta name="viewport" content="width=device-width">
  <link href="../src/styles.css" rel="stylesheet">
  <script src="loadMaxImages.js"></script>
</head>

<body class='min-h-screen h-screen grid grid-cols-1 justify-between ' onload="loadMaxImages('newArrivals',Math.max((screen.width / 320)+2, 5));loadMaxImages('onSale',Math.max((screen.width / 320)+2, 5));">

  <body class='h-screen grid grid-cols-1 justify-between '>
    <header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
      <a href="index.html" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
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
            <a href="logInPage.html"><button type="button" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log
                in</button></a>
          </li>
          <li class="block">
            <a href="registerPage.html"><button type="button" class="w-full md:w-20 h-10 bg-black text-white active:bg-neutral-500 rounded-lg">Register</button></a>
          </li>
        </ul>

      </div>
    </header>
    <main name="body_wrapper" class="grid grid-cols-1 w-full h-full">
      <div name="welcome_text" class="text-2xl justify-self-center grid-cols-1 grid justify-items-center w-fit font-bold mt-3 mb-5">
        <span>Discover the Latest Fashion Trends</span>
        <br>
        <span>Find the perfect outfit for every occasion with our exclusive collections.</span>
        <button type="submit" class="m-3 w-fit bg-neutral-300 active:bg-neutral-200 rounded-2xl p-3">Shop now</button>
      </div>
      <! –– Shouldn't there be javascript dictating how many elements can be on screen at one time? -->
        <div name="product_box" class='p-10 '>
          <a href="allProducts.html" class="text-4xl font-bold ">New Arrivals></a>
          <div name="newArrivals" id="newArrivals" class="w-full grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap ">
            <!-- here go all items -->
          </div>
        </div>
        <div name="product_box" class='p-10 '>
          <a href="allProducts.html" class="text-4xl font-bold ">On Sale></a>
          <div name="onSale" id="onSale" class="w-full grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap ">
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

