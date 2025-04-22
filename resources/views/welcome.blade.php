@extends('layouts.app')

@section('main_content')
<div name="welcome_text" class="text-2xl justify-self-center grid-cols-1 grid justify-items-center w-fit font-bold mt-3 mb-5">
    <span>Discover the Latest Fashion Trends</span>
    <br>
    <span>Find the perfect outfit for every occasion with our exclusive collections.</span>
    <a href="{{ url('allProducts') }}" class="m-3 w-fit bg-neutral-300 hover:bg-neutral-200 rounded-2xl p-3">Shop now</a>
</div>

<div name="product_box">
    <a href="{{ url('allProducts') }}" class="text-4xl font-bold px-10">New Arrivals ></a>
    <div name="newArrivals" class="px-10 w-screen grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap">
        @foreach($newArrivals as $product)
            <div class="flex flex-col w-80">
                <a href="{{ url('productDetail/' . $product['id']) }}" class="w-full h-52 bg-neutral-300 rounded-2xl overflow-hidden">
                    <img src="{{ $product['imagePath'] }}" alt="{{ $product['name'] }}" class="w-full h-full object-cover">
                </a>
                <span class="font-medium mt-2">{{ $product['name'] }}</span>
                <span class="text-lg">
                    @if($product['originalPrice'])
                        <s class="text-gray-500">${{ number_format($product['originalPrice'], 2) }}</s>
                    @endif
                    ${{ number_format($product['price'], 2) }}
                </span>
            </div>
        @endforeach
    </div>
</div>

<div name="product_box">
    <a href="{{ url('allProducts') }}" class="px-10 text-4xl font-bold">On Sale ></a>
    <div name="onSale" class="px-10 w-screen grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap">
        @foreach($onSaleItems as $product)
            <div class="flex flex-col w-80">
                <a href="{{ url('productDetail/' . $product['id']) }}" class="w-full h-52 bg-neutral-300 rounded-2xl overflow-hidden">
                    <img src="{{ $product['imagePath'] }}" alt="{{ $product['name'] }}" class="w-full h-full object-cover">
                </a>
                <span class="font-medium mt-2">{{ $product['name'] }}</span>
                <span class="text-lg">
                    @if($product['originalPrice'])
                        <s class="text-gray-500">${{ number_format($product['originalPrice'], 2) }}</s>
                    @endif
                    ${{ number_format($product['price'], 2) }}
                </span>
            </div>
        @endforeach
    </div>
</div>

@vite('resources/js/responsiveHeader.js')
@endsection
