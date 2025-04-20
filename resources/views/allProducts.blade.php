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
      @include('layouts.header')
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
    @include("layouts.footer")

</body>
<script src="{{ asset('js/allProductsScreenAdjuster.js')}}"></script>
<script src="{{ asset('js/responsiveHeader.js')}}"></script>

</html>
