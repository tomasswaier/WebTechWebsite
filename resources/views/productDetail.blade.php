@extends('layouts.app')

@section('main_content')
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
@endsection
