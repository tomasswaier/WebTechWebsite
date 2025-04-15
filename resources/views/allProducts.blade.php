<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="{{ url('/css/styles.css') }}" />
  <script src="{{ asset('js/loadMaxImages.js') }}"></script>
  <meta name="viewport" content="width=device-width">
  @vite('resources/css/app.css')
</head>

<body class='grid grid-flow-row h-screen min-h-screen ' onload="loadMaxImages('itemDisplay',8);">
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
  <main id="main" class="grid h-fit gap-8 grid-flow-col ">
    <div id="itemFiltersWrapper" name="leftSide" class="max-w-64 w-full mx-10 my-20 ">
      <span class="font-bold text-2xl">Filters</span>
      <fieldset id="itemsFiltersFieldset" class="mr-4">
        <span class="font-bold ">Categories</span>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>T-shirt</span>
        </div>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>Sweatpants</span>
        </div>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>Shirts</span>
        </div>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>Pants</span>
        </div>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>Hoodies</span>
        </div>
        <div>
          <input type="checkbox" name="placeholder" value="placeholder" class="accent-black rounded-4xl mr-1.5">
          <span>Hats</span>
        </div>
        <div>
          <span class="font-bold">Color</span>
          <div id="colorSelection" class="grid grid-cols-10">
            <!-- I want to make this automatic by calling a thing in php-->
            <label>
              <input type="checkbox" name="color_choice" value="white" class="peer hidden">
              <span class="w-5 h-5 rounded-full border-2 border-gray-300 block cursor-pointer peer-checked:ring-2 peer-checked:ring-black bg-white" aria-label="white">
              </span>
            </label>
            <label>
              <input type="checkbox" name="color_choice" value="black" class="peer hidden">
              <span class="w-5 h-5 rounded-full border-2 border-gray-300 block cursor-pointer peer-checked:ring-2 peer-checked:ring-black bg-black" aria-label="black">
              </span>
            </label>
          </div>
        </div>
        <div>
          <div class="grid justify-between grid-cols-2">
            <span class="font-bold mr-auto ">Price</span>
            <span class="justify-self-end">$0-$100</span>
          </div>
          <input type="range" name="" value="" class="w-full accent-neutral-200 ">


        </div>
      </fieldset>
    </div>
    <div name="rightSide" class="w-full  mt-16 mr-10">
      <div name="topSideOfItemsDisplay" class="flex flex-row justify-start space-x-3 w-full mb-5">
        <div class="border-2 p-2 rounded-lg">
          <span>Men's</span>
        </div>
        <div class="border-2 p-2 rounded-lg">
          <span>Women's</span>
        </div>
        <div class="border-2 p-2 rounded-lg ">
          <span>Unisex</span>
        </div>
        <div class="ml-auto border-2 p-2 rounded-lg ">
          <select>
            <option value="placeholder">Meow</option>
            <option value="placeholder">Meow2</option>
          </select>
        </div>
      </div>
      <div name="itemDisplay" id="itemDisplay" class="w-full flex flex-row flex-wrap justify-between">
        <!-- here go all items -->
      </div>
      <div name="buttonWrapper" class="grid justify-center align-middle">
        <input type="button" name="loadMode" value="Load More" class="border-black rounded-xl border-2 p-3 hover:bg-neutral-200" onclick="loadMaxImages('itemDisplay',8);">
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
<script src="{{ asset('js/allProductsScreenAdjuster.js')}}"></script>
<script src="{{ asset('js/responsiveHeader.js')}}"></script>

</html>
