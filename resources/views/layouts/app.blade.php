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
    <body class="w-screen  h-screen min-h-screen  grid grid-flow-row">
            <header class="px-4 py-4 w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
                @component('components.header')
                @endcomponent
            </header>
            <!-- Page Content -->
            <!-- <main class="grid h-fit gap-8 grid-flow-row">-->
                @yield('main_content')
            <!-- </main> -->
            <footer class="w-full h-auto mt-auto">
                <hr>
                <div class='relative top-10 grid mx-auto grid-flow-col align-middle w-fit space-x-5'>
                    <span>Contact</span>
                    <span>FAQ</span>
                    <span>&copy all rights reserved</span>
                </div>
            </footer>
    </body>
</html>
