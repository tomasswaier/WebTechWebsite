<a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto ">
    <img src="{{asset('icons/logo.png')}}" alt="logo" class="h-full">
</a>
<button id="hamburger_btn" type="button" data-collapse-toggle="hamburger_default" aria-controls="hamburger_default" aria-expanded="false" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open main menu</span>
    <img src="{{asset('icons/hamburgerIcon.png')}}" alt="hamburger icon" class="max-h-12 md:mb-0">
</button>
<div id="hamburger_default" class="absolute hidden bg-white mt-5 md:mt-0 top-full right-0 w-full z-50 md:static md:flex md:w-auto md:mr-3">
    <ul class="flex flex-col z-50 md:flex-row space-y-3 md:space-y-0 p-4 md:p-0 bg-white border border-gray-500 md:mt-0 md:border-0 md:bg-white md:space-x-2">
        <li class="relative block">
            <form method="post" action="#">
                <input type="search" name="search_query" placeholder="Search.." class="block ml-auto w-full md:w-96 rounded-lg border-black border p-1 focus:outline-none pl-5">
                <button type="submit" class="absolute top-0 z-20 end-0 rounded-e-lg bg-black p-2 focus:ring-1 border border-black">
                    <img src="{{asset('icons/search.png')}}" alt="search-icon" class="w-4 h-4">
                </button>
            </form>
        </li>
        <li class="block">
            <a href="{{ route('cartOverview')}}" class="flex w-full justify-center space-x-3 md:space-x-0 border md:border-transparent bg-white md:bg-transparent border-black rounded-lg">
                <img src="{{asset('icons/shoppingCart.png')}}" alt="shopping cart icon" class="max-h-10 mb-2 md:mb-0">
                <span class="flex md:hidden self-center">Cart</span>
            </a>
        </li>
        @if(Auth::check())
            <li class="block">
                <a href="{{ url('/profile')}}" class="flex w-full justify-center space-x-3 md:space-x-0 border md:border-transparent bg-white md:bg-transparent border-black rounded-lg">
                    <img src="{{asset('icons/person.png')}}" alt="user page icon" class="max-h-10 mb-2 md:mb-0">
                    <span class="flex md:hidden self-center">User Profile</span>
                </a>
            </li>
            <li class="block">
                <form method="post" action="{{route("logout")}}">
                    @csrf
                    <button type="submit" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log
                        out</button>
                </form>
            </li>
        @else
            <li class="block">
                <a href="{{ route('login')}}"><button type="button" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log
                        in</button></a>
            </li>
            <li class="block">
                <a href="{{ route('register')}}"><button type="button" class="w-full md:w-20 h-10 bg-black text-white active:bg-neutral-500 rounded-lg">Register</button></a>
            </li>
        @endif

    </ul>

</div>
