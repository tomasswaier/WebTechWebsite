<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <link href="../src/styles.css" rel="stylesheet">
  <script src="loadMaxImages.js"></script>
  <meta name="viewport" content="width=device-width">
    @vite('resources/css/app.css')

</head>

<body class='h-screen grid grid-cols-1 justify-between ' onload="loadMaxImages('newArrivals',Math.max((screen.width / 320), 5));loadMaxImages('onSale',Math.max((screen.width / 320), 5));">
<header class="w-full flex flex-wrap justify-end items-center mx-auto h-20 relative z-20">
  <a href="{{ url('/')}}" id="logo" class="w-auto h-14 bg-neutral-300 rounded-2xl mr-auto m-5">
    <img src="icons/logo.png" alt="logo" class="h-full">
  </a>
  <div class="flex bg-white mt-5 w-auto mr-3">
    <a href="#" class="w-full md:w-20 p-1 h-10 bg-white text-black border border-black active:bg-neutral-400 rounded-lg flex items-center justify-center">
      <span>Log out</span>
    </a>
  </div>
</header>
  <main name="body_wrapper" class="w-full h-full">
    <div name="table wrapper" class="w-full px-20 h-fit">
      <div name="buttonWrapper" class="w-full h-fit grid">
        <button type="button" class="w-fit bg-black text-white rounded-lg p-3">+ Add Item</button>
      </div>
      <table class="w-full table-fixed">
        <thead class="gap-5 ">
          <td></td>
          <td><span>Category</span></td>
          <td><span>Name</span></td>
          <td><span>Price</span></td>
          <td><span>Stock</span></td>
          <td><span>Edit</span></td>
          <td><span>Delete</span></td>
        </thead>
        <tbody>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>
          <tr>
            <td>
              <div class=" w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden">
                <img src="product_images/example_shirt_front.png" alt="meow">
              </div>
            </td>
            <td><span>shirt</span></td>
            <td><span>cool shirt</span></td>
            <td><span>$28.00</span></td>
            <td><span>in Stock</span></td>
            <td><img src="icons/editIcon.png" alt="edit icon" class="w-12"></td>
            <td><img src="icons/trashIcon.png" alt="trash icon" class="w-12"></td>
          </tr>

        </tbody>
      </table>

      <button type="" class="p-2 border-2 rounded-lg">Load More</button>

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
  <script src='responsiveHeader.js'>
  </script>

</body>
