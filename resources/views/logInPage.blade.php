@extends('layouts.app')

@section('main_content')

    <form method="post" class="grid grid-flow-row my-auto space-y-3 w-120">
        <span>Login</span>
        <input class="custom-input-field border-neutral-200" type="text" name="" value="" placeholder="Email or Username">
        <span>Password</span>
        <input class="custom-input-field border-neutral-200" type="text" name="" value="" placeholder="Password">
        <div class="grid grid-flow-col space-x-48">
        <span>
          <input class='accent-black' type="checkbox" name="" value="">
          <span>Remember Me</span>
        </span>
            <a class="ml-auto" href="">Forgot password?</a>
        </div>
        <button class="border bg-black text-white p-2 rounded-xl" type="submit">Log in</button>
        <a class="mx-auto" href="{{url("/registerPage")}}">Don't have an account yet? Register!</a>
    </form>
@endsection
