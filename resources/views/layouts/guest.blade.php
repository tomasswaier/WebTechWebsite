<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0">
            <header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
                <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
                    <img src="icons/logo.png" alt="logo" class="h-full">
                </a>
                <button id="hamburger_btn" type="button" data-collapse-toggle="hamburger_default" aria-controls="hamburger_default" aria-expanded="false" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
                    <span class="sr-only">Open main menu</span>
                    <img src="icons/hamburgerIcon.png" alt="hamburger icon" class="max-h-12 md:mb-0">
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
                            <a href="{{ url('login')}}"><button type="button" class="w-full md:w-20 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg">Log
                                    in</button></a>
                        </li>
                        <li class="block">
                            <a href="{{ url('register')}}"><button type="button" class="w-full md:w-20 h-10 bg-black text-white active:bg-neutral-500 rounded-lg">Register</button></a>
                        </li>
                    </ul>

                </div>
            </header>
            <main class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                {{ $slot }}
            </main>
            <footer class="w-full h-28 bottom-0 mt-auto">
                <hr>
                <div class='relative top-10 grid mx-auto grid-flow-col align-middle w-fit space-x-5'>
                    <span>Contact</span>
                    <span>FAQ</span>
                    <span>c all rights reserved</span>
                </div>
            </footer>
        </div>
    </body>
</html>
