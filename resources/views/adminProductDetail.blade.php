@extends('layouts.app')

@section('main_content')
<main name="bodyWrapper" class="w-full h-full grid grid-cols-1 px-10">
  <form action="{{ url('adminProductDetail') }}" method="POST" enctype="multipart/form-data">
    @csrf

    <div id="imageDisplay" class="w-fit grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 lg:grid-cols-6 overflow-scroll no-scrollbar space-x-5 whitespace-nowrap items-start">
    @isset($product)
        <!-- Main Image -->
        @foreach($product->images as $image)
            @if($image->is_main)
                <div class="relative main-image">
                    <img src="{{ asset('product_images/'.$image->image_url) }}"
                         alt="Main product image"
                         class="w-50 h-50 mb-2 border-black border-2 rounded-xl">
                    <img src="{{ asset('icons/trashIcon.png') }}"
                         class="absolute right-5 bottom-5 w-10 h-10 z-50 cursor-pointer"
                         onclick="this.parentElement.remove()">
                </div>
                @break
            @endif
        @endforeach

        <!-- Other Images -->
        @foreach($product->images as $image)
            @unless($image->is_main)
                <div class="relative">
                    <img src="{{ asset('product_images/'.$image->image_url) }}"
                         class="w-50 h-50 mb-2 border-black border-2 rounded-xl"
                         alt="Product image">
                    <img src="{{ asset('icons/trashIcon.png') }}"
                         class="absolute right-5 bottom-5 w-10 h-10 z-50 cursor-pointer"
                         onclick="this.parentElement.remove()">
                </div>
            @endunless
        @endforeach
    @endisset
      <!-- Images will be added here dynamically -->
      <label for="user_image" class="size-auto relative block items-center cursor-pointer order-last">
        <input id="user_image" class="text-transparent absolute size-auto" name="images[]" type="file" multiple onchange="addImage()" />
        <img src="{{ asset('icons/addImage.png') }}" class="w-50 h-50 mb-2 border-2 border-black rounded-xl" />
      </label>
    </div>

    <div>
      <span class="text-lg font-bold">Name of product</span>
      <input type="text" class="w-full md:max-w-[50vw] custom-input-field w-120 border-neutral-300" placeholder="Cool White Shirt" name="name" value="{{ $product->name ?? '' }}" required><br>

      <span class="text-lg font-bold">Description</span>
      <br>
      <textarea name="description" rows="4" cols="120" placeholder="Coolest cat shirt in the galaxy from milkiway to neptune!!!" class="w-full md:max-w-[50vw] border border-neutral-300 rounded-lg" maxlength="200"  required>{{ $product->description ?? '' }}</textarea><br>

      <span class="text-lg font-bold">Category</span>
      <select name="category_id" class="w-full md:max-w-[50vw] border border-neutral-300 rounded-lg p-2" required>
@foreach($categories as $category)
          <option value="{{ $category->id }}"
            @selected(isset($product) && $product->category_id == $category->id)>
            {{ $category->name }}
          </option>
        @endforeach
      </select><br>

      <span class="text-lg font-bold">Color</span>
      <div class="grid grid-cols-2 gap-x-1 size-fit">
      <!-- like here should be colors but the thing we use rn is kinda bad so imma let it be like dis-->
        <input id="colorInput" type="color" value="{{ $color->hex_code ?? '' }}" class="size-full">
        <button type="button" class="w-30 bg-black text-white font-bold rounded-md h-10" onclick="addColor()">Add color</button>
      </div>
      <div id="colorOptionsWrapper" class="grid grid-flow-col size-fit"></div>

      <span class="text-lg font-bold">Price</span>
      <input type="number" step="0.01" placeholder="10.00" class="md:max-w-[25vw] custom-input-field w-80 border-neutral-300" name="price" value="{{ $product->price ?? ''}}" required>

      <span class="text-lg font-bold">Stock count</span>
      <input type="number" placeholder="10" class="md:max-w-[25vw] custom-input-field w-80 border-neutral-300" name="stock" value="{{ $product->in_stock ?? ''}}" required>
    </div>

    <button class="w-30 bg-black text-white font-bold rounded-md h-10 my-3" type="submit">Save</button>
  </form>
</main>
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
@endsection
