@extends('layouts.app')

@section('main_content')
<div name="welcome_text" class="text-2xl justify-self-center grid-cols-1 grid justify-items-center w-fit font-bold mt-3 mb-5">
    <span>Discover the Latest Fashion Trends</span>
    <br>
    <span>Find the perfect outfit for every occasion with our exclusive collections.</span>
    <button type="submit" class="m-3 w-fit bg-neutral-300 active:bg-neutral-200 rounded-2xl p-3">Shop now</button>
</div>
<! –– Shouldn't there be javascript dictating how many elements can be on screen at one time? -->
<div name="product_box" class='p-10 '>
    <a href="{{url('allProducts')}}" class="text-4xl font-bold ">New Arrivals></a>
    <div name="newArrivals" id="newArrivals" class="w-full grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap ">
        <!-- here go all items -->
    </div>
</div>
<div name="product_box" class='p-10 '>
    <a href="{{url('allProducts')}}" class="text-4xl font-bold ">On Sale></a>
    <div name="onSale" id="onSale" class="w-full grid grid-flow-col overflow-scroll no-scrollbar space-x-10 whitespace-nowrap ">
    </div>
</div>
@endsection
