@extends('layouts.app')

@section('main_content')
    <form method="post" class="grid grid-flow-row space-y-3 w-120">
      <span>Register</span>
      <input class="border rounded-lg p-2 border-neutral-200" type="text" name="" value="" placeholder="Email">
      <span>Username</span>
      <input class="border rounded-lg p-2 border-neutral-200" type="text" name="" value="" placeholder="Guy_M0ntag">
      <span>Password</span>
      <input class="border rounded-lg p-2 border-neutral-200" type="text" name="" value="" placeholder="Password">
      <span>Re-enter Password</span>
      <input class="border rounded-lg p-2 border-neutral-200" type="text" name="" value="" placeholder="Password">
      <button class="border bg-black text-white p-2 rounded-xl" type="submit">Register</button>
      <a class="mx-auto" href="{{url("/logInPage")}}">have an account? Log in!</a>


    </form>

@vite('resources/js/responsiveHeader.js')
@endsection
