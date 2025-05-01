@extends('layouts.app')

@section('main_content')
  <main name="body_wrapper" class="w-full grid h-fit gap-8 grid-flow-col mb-50">
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
@vite('resources/js/responsiveHeader.js')
@endsection
