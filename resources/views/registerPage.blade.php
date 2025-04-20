<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
    @vite('resources/css/app.css')

  <link href="../src/styles.css" rel="stylesheet">
  <script src="loadMaxImages.js"></script>
  <meta name="viewport" content="width=device-width">
</head>

<body class='h-screen container'>
  <header class="w-full grid grid-cols-1 justify-end items-center space-x-2.5 h-24">
    <div name="logo" class="w-auto mx-2 h-14 bg-neutral-300 rounded-2xl mr-auto ">
      <a href="{{ url('/')}}"><img src="icons/logo.png" alt="logo" class="h-full w-fit"></a>
    </div>
  </header>
  <main name="body_wrapper" class="grid place-items-center  w-full h-full">
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
