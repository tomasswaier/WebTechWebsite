<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=menu" />
  <title>Product Detail</title>
    @vite('resources/css/app.css')


</head>

<body class='h-screen grid grid-cols-1 justify-between '>
  <header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
    <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
      <img src="icons/logo.png" alt="logo" class="h-full">
    </a>
    <button id="hamburger_btn" type="button" data-collapse-toggle="hamburger_default" aria-controls="hamburger_default" aria-expanded="false" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
      <span class="sr-only">Open main menu</span>
      <span class="material-symbols-outlined">
        menu
      </span>
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
          <a href="{{ url('logInPage')}}"><button type="button" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log in</button></a>
        </li>
        <li class="block">
          <a href="{{ url('registerPage')}}"><button type="button" class="w-full md:w-20 h-10 bg-black text-white active:bg-neutral-500 rounded-lg">Register</button></a>
        </li>
      </ul>

    </div>
  </header>

  <main class="container mx-auto px-4 py-4">
    <div class="grid gird-rows-2 md:grid-cols-2 -mx-4">
      <div id="product_photos" class="w-full h-max-[100vh] px-4 mb-8">
        <img id="mainImage" src="product_images/example_shirt_front.png" alt="img1" class="w-auto max-h-[50vh] mb-4 justify-self-center">
        <div class="grid grid-cols-3 gap-4 py-4 overflow-x-auto overflow-y-hidden items-center">
          <img src="product_images/example_shirt_front.png" alt="img0" class="w-auto max-h-[25vh] hover:scale-125 transition duration-300" onclick="changeImage(this.src)">
          <img src="product_images/example_shirt_side.png" alt="img2" class="w-auto max-h-[25vh] hover:scale-125 transition duration-300" onclick="changeImage(this.src)">
          <img src="product_images/example_shirt_side1.png" alt="img3" class="w-auto max-h-[25vh] hover:scale-125 transition duration-300" onclick="changeImage(this.src)">
        </div>
      </div>
      <!--Product info-->
      <div id="product_info" class="w-full px-4">
        <h1 class="font-bold mb-5 text-xl">Meow T-shirt</h1>
        <p class="mb-3">
          Elevate your everyday style with this essential Meow T-Shirt. Crafted from premium, breathable cotton, it offers unbeatable comfort and a perfect fit. The timeless crew neck design pairs effortlessly with jeans, joggers, or shorts, making it a versatile staple in any wardrobe. Whether you’re dressing it up or keeping it casual, this T-shirt has you covered.
        <p>
        <h2 class="font-bold mb-3">Color</h2>
        <div id="color_picker" class="grid grid-cols-2 w-fit gap-4 mb-3">
          <label>
            <input type="radio" name="selectedColor" value="black" class="peer hidden">
            <span class="w-8 h-8 rounded-full border-2 border-gray-300 block cursor-pointer
                peer-checked:ring-2 peer-checked:ring-black bg-black" aria-label="black">
            </span>
          </label>
          <label>
            <input type="radio" name="selectedColor" value="white" class="peer hidden">
            <span class="w-8 h-8 rounded-full border-2 border-gray-300 block cursor-pointer
                peer-checked:ring-2 peer-checked:ring-black bg-white" aria-label="white">
            </span>
          </label>
        </div>
        <h2 class="font-bold mb-3">Material</h2>
        <p class="mb-3">100% Cotton</p>
        <form action="#" method="post" class="grid grid-cols-2 gap-5 max-w-md">
          <h2 class="font-bold p-2 text-xl">$28.00</h2>
          <select name="size" id="size_selection" class="border-black border rounded-lg focus:border-black-500 pl-[10px]">
            <option selected value="">Select size</option>
            <option value="S">S</option>
            <option value="M">M</option>
            <option value="L">L</option>
            <option value="XL">XL</option>
          </select>
          <button type="submit" class="bg-black rounded-lg text-white p-2">
            Add to cart
          </button>
          <input type="number" name="quantity" placeholder="0" class="border border-black rounded-lg pl-[14px]">
        </form>



      </div>
    </div>
  </main>
  <footer class="w-full h-20 bottom-0 mt-auto">
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
