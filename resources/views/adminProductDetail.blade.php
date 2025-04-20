<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <meta name="viewport" content="width=device-width">
  <link href="../src/styles.css" rel="stylesheet">
  <script src="displayInputImage.js"></script>
    @vite('resources/css/app.css')

</head>

<body class='h-screen grid grid-cols-1 justify-between'>
<header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
  <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
    <img src="icons/logo.png" alt="logo" class="h-full">
  </a>
  <div class="flex bg-white mt-5 w-auto mr-3">
    <a href="#" class="w-full md:w-20 p-1 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg flex items-center justify-center">
      <span>Log out</span>
    </a>
  </div>
</header>
  <main name="bodyWrapper" class="w-full h-full grid grid-cols-1 px-10">
    <form action="#" method="post">
      <div id="imageDisplay" class="w-fit grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 lg:grid-cols-6 overflow-scroll no-scrollbar space-x-5 whitespace-nowrap items-start">
        <!-- here go all items -->
        <label for="user_image" class="size-auto relative block items-center cursor-pointer order-last">
          <input id="user_image" class="text-transparent absolute size-auto" name="user_image" type="file" onchange="addImage()" />
          <img src="icons/addImage.png" class="w-50 h-50 mb-2 border-2 border-black rounded-xl" />
        </label>
      </div>

      <div>
        <span class="text-lg font-bold">Name of product</span>
        <br>
        <input type="text" class="w-full md:max-w-[50vw] custom-input-field w-120 border-neutral-300" placeholder="Cool White Shirt" name="product_name">
        <br>
        <span class="text-lg font-bold">Label</span>
        <br>
        <textarea name="product_description" rows="4" cols="120" placeholder="Coolest cat shirt in the galaxy from milkiway to neptune!!!" class="w-full md:max-w-[50vw] border border-neutral-300 rounded-lg" maxlength="200"></textarea>
        <br>
        <span class="text-lg font-bold">Color</span>
        <br>
        <div class="grid grid-cols-2 gap-x-1 size-fit">
          <input id="colorInput" type="color" class="size-full">
          <button type="button" class="w-30 bg-black text-white font-bold rounded-md h-10" onclick="addColor()">Add color</button>
        </div>
        <div id="colorOptionsWrapper" class="grid grid-flow-col size-fit">


        </div>
        <br>
        <span class="text-lg font-bold">Price</span>
        <br>
        <input type="text" placeholder="$10.00" class="w-full md:max-w-[25vw] custom-input-field w-80 border-neutral-300" name="product_price">
        <br>
        <span class="text-lg font-bold">Stock count</span>
        <br>
        <input type="text" placeholder="10" class="w-full md:max-w-[25vw] custom-input-field w-80 border-neutral-300" name="product_instock">
      </div>
      <button class="w-30 bg-black text-white font-bold rounded-md h-10 my-3" type="submit">Save</button>
    </form>
  </main>
    @include("layouts.footer")

  <script src='responsiveHeader.js'>
  </script>
</body>
<script>
  const colorsArea = document.querySelector("#colorOptionsWrapper");
  function addColor() {
    const colorInput = document.querySelector("#colorInput");
    colorsArea.innerHTML += `
        <label>
            <input type="text" name="product_color" value="${colorInput.value}" class="hidden">
            <span
                    class="w-10 h-10 rounded-full border-2 border-gray-300 block cursor-pointer
        peer-checked:ring-2 peer-checked:ring-black bg-[${colorInput.value}]"
                    aria-label="black"
                    onclick="this.parentElement.remove()"
            </span>
        </label>
    `
  }

  function addImage() {
    const imageArea = document.querySelector("#imageDisplay");
    // displays  selected user image to user for confirmation/better ux
    const inputElemnt = document.getElementById("user_image")
    inputElemnt.classList.add("hidden", "none")
    var image = inputElemnt.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
      imageArea.innerHTML += `
        <div class="relative">
            <input id="user_image" class="text-transparent w-50 h-50 border mb-2 border-black border-2 rounded-xl" name="product_image" type="image" value="${e.target.result}" src="${e.target.result}" disabled/>
            <img src="icons/trashIcon.png" class="absolute right-5 bottom-5 w-10 h-10 z-50 cursor-pointer" onclick="this.parentElement.remove()"/>
        </div>
    `
    };
    reader.readAsDataURL(image);
  }
</script>
