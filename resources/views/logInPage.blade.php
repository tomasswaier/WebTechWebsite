<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link href="../src/styles.css" rel="stylesheet">
  <script src="loadMaxImages.js"></script>
    @vite('resources/css/app.css')

</head>

<body class='h-screen grid grid-rows-3 justify-stretch' onload="loadMaxImages('newArrivals',Math.max((screen.width / 320), 5));loadMaxImages('onSale',Math.max((screen.width / 320), 5));">
  <header class="w-full grid grid-cols-1 justify-end items-center space-x-2.5 h-24">
    <div name="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto ">
      <a href="{{ url('/')}}"><img src="icons/logo.png" alt="logo" class="h-full w-fit"></a>
    </div>
  </header>
  <main name="body_wrapper" class="grid justify-center  w-full h-full">
    <div class="grid grid-flow-row my-auto space-y-3 w-120">
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
      <a class="mx-auto" href="">Don't have an account yet? Register!</a>


    </div>

  </main>
  <footer class="w-full h-28 bottom-0 mt-auto">
    <hr>
    <div class='relative top-10 grid mx-auto grid-flow-col align-middle w-fit space-x-5'>
      <span>Contact</span>
      <span>FAQ</span>
      <span>c all rights reserved</span>
    </div>
  </footer>

</body>

</html>
