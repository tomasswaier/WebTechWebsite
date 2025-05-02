@extends('layouts.app')

@section('main_content')
<div class="grid h-fit gap-8 grid-flow-col">

    <div id="itemFiltersWrapper" name="leftSide" class="max-w-64 w-full mx-10 my-20 ">
      <span class="font-bold text-2xl">Filters</span>
      <fieldset id="itemsFiltersFieldset" class="mr-4">
        <span class="font-bold ">Categories</span>
        <div>
            <input value="all" type="radio" name="filterOption" id="category_all" class="accent-black rounded-4xl mr-1.5" checked>
            <label for="category_all">All Categories</label>
        </div>
        <div>
          <input value='T-shirt' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>T-shirt</span>
        </div>
        <div>
          <input value='Sweatpant' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>Sweatpants</span>
        </div>
        <div>
          <input value='Shirt' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>Shirts</span>
        </div>
        <div>
          <input value='Pant' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>Pants</span>
        </div>
        <div>
          <input value='Hoodie' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>Hoodies</span>
        </div>
        <div>
          <input value='Hat' type="radio" name="filterOption" " class="accent-black rounded-4xl mr-1.5">
          <span>Hats</span>
        </div>
        <div>
          <span class="font-bold">Color</span>
          <div id="colorSelection" class="grid grid-cols-10">
            <!-- I want to make this automatic by calling a thing in php-->
            <label>
              <input type="radio" name="color_choice" value="white" class="peer hidden">
              <span class="w-5 h-5 rounded-full border-2 border-gray-300 block cursor-pointer peer-checked:ring-2 peer-checked:ring-black bg-white" aria-label="white">
              </span>
            </label>
            <label>
              <input type="radio" name="color_choice" value="black" class="peer hidden">
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
          <input type="range" name="priceRange" id="priceRange" value="0" class="w-full accent-neutral-200 ">


        </div>
      </fieldset>
    </div>
    <div name="rightSide" class="w-full  mt-16 mr-10">
      <div name="topSideOfItemsDisplay" class="flex flex-row justify-start space-x-3 w-full mb-5">
        <div class="p-2">
            <span>common filters:</span>
        </div>
        <button class="border-2 p-2 rounded-lg category-button" data-category="T-shirt">
          <span>T-shirt</span>
        </button>
        <button class="border-2 p-2 rounded-lg category-button" data-category="Hat">
          <span>Hats</span>
        </button>
        <button class="border-2 p-2 rounded-lg category-button" data-category="Pant">
          <span>Pants</span>
        </button>

        <div class="ml-auto border-2  rounded-lg ">
          <select class="border p-2 rounded" id="priceSort">
            <option value="oldest">Oldest</option>
            <option value="newest">Newest</option>
            <option value="price-highest">Highest to lowest</option>
            <option value="price-lowest">Lowest to highest</option>
          </select>
        </div>
      </div>
      <div name="itemDisplay" id="itemDisplay" class="w-full flex flex-row flex-wrap justify-between">
        <!-- here go all items -->
      </div>
      <div name="buttonWrapper" class="grid justify-center align-middle">
        <input type="button" name="loadMode" value="Load More" class="border-black rounded-xl border-2 p-3 hover:bg-neutral-200" onclick="loadMoreItems()">
      </div>

    </div>

    </div>
    @vite('resources/js/loadMaxImages.js')
    @vite('resources/js/allProductsScreenAdjuster.js')
    @vite('resources/js/responsiveHeader.js')
<script>
    // Track current state
let currentCount = 0;
const itemsPerLoad = 8;
let currentCategory = 'all';
let currentSort = 'oldest';
let currentMaxPrice = Infinity;
let searchQuery = ''; //

    // Initial load
    document.addEventListener("DOMContentLoaded", () => {
        loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice);
    });
    function handleSearch() {
    const input = document.getElementById("searchInput");
    searchQuery = input.value.trim();
    currentCount = 0;
    document.getElementById("itemDisplay").innerHTML = "";
    loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice, currentCount, searchQuery);
    }

document.getElementById("searchInput").addEventListener("keypress", function (e) {
    if (e.key === "Enter") {
        e.preventDefault();
        handleSearch();
    }
});


    // Category filter change
    document.querySelectorAll('input[name="filterOption"]').forEach(radio => {
        radio.addEventListener('change', (e) => {
            currentCount = 0; // Reset count when filters change
            currentCategory = e.target.value;
            document.getElementById("itemDisplay").innerHTML = "";
            loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice);
        });
    });

    // Price range change
    document.getElementById('priceRange').addEventListener('change', (e) => {
        currentCount = 0;
        currentMaxPrice = e.target.value;
        document.getElementById("itemDisplay").innerHTML = "";
        loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice);
    });

    // Sort change
    document.getElementById('priceSort').addEventListener('change', (e) => {
        currentCount = 0;
        currentSort = e.target.value;
        document.getElementById("itemDisplay").innerHTML = "";
        loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice);
    });

    // Load More function

    function loadMoreItems() {
        currentCount += itemsPerLoad;
        loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice, currentCount, searchQuery);
    }
    document.querySelectorAll('.category-button').forEach(button => {
        button.addEventListener('click', () => {
          currentCount = 0;
          currentCategory = button.dataset.category;
          document.getElementById("itemDisplay").innerHTML = "";
          loadMaxImages('itemDisplay', itemsPerLoad, currentCategory, currentSort, currentMaxPrice, currentCount, searchQuery);

          // Optional: also select matching radio if it exists
          const radioToCheck = document.querySelector(`input[name="filterOption"][value="${currentCategory}"]`);
          if (radioToCheck) {
            radioToCheck.checked = true;
          }
        });
    });


</script>
</div>

@endsection
