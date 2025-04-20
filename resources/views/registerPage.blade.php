<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
    @vite('resources/css/app.css')

  <link href="../src/styles.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width">
</head>

<body class='h-screen grid grid-rows-3 justify-stretch' onload="loadMaxImages('newArrivals',Math.max((screen.width / 320), 5));loadMaxImages('onSale',Math.max((screen.width / 320), 5));">
  <header class="w-full grid grid-cols-1 justify-end items-center space-x-2.5 h-24">
    <div name="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto ">
      <a href="{{ url('/')}}"><img src="icons/logo.png" alt="logo" class="h-full w-fit"></a>
    </div>
  </header>
  <main name="body_wrapper" class="grid justify-center  w-full h-full">
    <div class="grid grid-flow-row my-auto space-y-3 w-120">
      <span>Register</span>
      <input class="custom-input-field border-neutral-200" type="text" name="" value="" placeholder="Email">
      <span>Username</span>
      <input class="custom-input-field border-neutral-200" type="text" name="" value="" placeholder="Guy_M0ntag">
      <span>Password</span>
      <input class="custom-input-field border-neutral-200" type="text" name="" value="" placeholder="Password">
      <span>Re-enter Password</span>
      <input class="border rounded-lg p-2 border-neutral-200" type="text" name="" value="" placeholder="Password">
      <button class="border bg-black text-white p-2 rounded-xl" type="submit">Register</button>
      <a class="mx-auto" href="">have an account? Log in!</a>


    </div>

  </main>
    @include("layouts.footer")

</body>

</html>
