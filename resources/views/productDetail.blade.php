@extends('layouts.app')

@section('main_content')
    <div class="container grid gird-rows-2 md:grid-cols-2 -mx-4">
        <div id="product_photos" class="w-full flex flex-col h-max-[100vh] pl-4 mb-8">
            <img id="mainImage" src="{{asset('product_images/' . $mainImage->image_url)}}" alt="product front" class="w-auto object-contain max-h-[50vh] mb-4 justify-self-center">
            <div class="grid grid-cols-3 gap-4 py-4 overflow-x-auto overflow-y-hidden items-center">
                @foreach($product->images as $image)
                    <img src="{{asset('product_images/' . $image->image_url)}}" alt="img0" class="w-auto max-h-[25vh] hover:scale-125 transition duration-300" onclick="changeImage(this.src)">
                @endforeach
            </div>
        </div>
        <!--Product info-->
        <div id="product_info" class="w-auto">
            @if( session('success'))
                <h2 class="text-xl font-bold">
                    {{session('success')}}
                </h2>
                <p>
                    You can now view the <a href="{{route('cartOverview')}}" class="underline">cart</a>
                </p>
            @endif
            <h1 class="font-bold mb-5 text-xl">{{$product->name}}</h1>
            <p class="mb-3">
                {{$product->description}}
            <p>
            <h2 class="font-bold mb-3">Color</h2>
            <div id="color_picker" class="grid grid-cols-2 w-fit gap-4 mb-3">
                    <label>
{{--                        <input type="radio" name="selectedColor" value="{{$product->color}}" class="peer hidden">--}}
                        <span class="w-8 h-8 rounded-full border-2 border-gray-300 block
                peer-checked:ring-2 peer-checked:ring-black bg-[{{$product->color}}]" aria-label="{{$product->color}}">
                        </span>
                    </label>
            </div>
            <h2 class="font-bold mb-3">Category</h2>
            <p class="mb-3">{{$product->category->name}}</p>
            <h2 class="font-bold text-xl mb-2">
                @if($product->discounted_price != $product->price)
                    <s class="text-gray-300 font-normal">${{$product->price}}</s> ${{$product->discounted_price}}
                @else
                    ${{$product->price}}
                @endif
            </h2>
            <form action="{{route('cart.add', ['product_id' => $product->id])}}" method="post" class="grid grid-cols-2 gap-5 max-w-md">
                @csrf
                <select name="size" id="size_selection" class="border-black border rounded-lg focus:border-black-500 pl-[10px]" required>
                    <option selected value="">Select size</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                </select>
                <input type="number" name="quantity" value="0" min="1" class="border border-black rounded-lg p-2 pl-3">
                <button type="submit" class="bg-black rounded-lg text-white p-2">
                    Add to cart
                </button>
            </form>



        </div>
    </div>
@vite('resources/js/displayItemImages.js')
{{--<script>--}}
{{--    document.addEventListener("DOMContentLoaded", () => {--}}
{{--        const productId = `{{ $productId }}`;--}}
{{--        loadItemImages('product_photos', productId);--}}
{{--    });--}}
{{--</script>--}}
<script>
    function changeImage(src) {
        let mainImage = document.getElementById('mainImage')
        mainImage.src = src;
    }
</script>
@endsection
