@extends('layouts.app')

@section('main_content')
  <main name="body_wrapper" class="w-full grid h-fit gap-8 grid-flow-col mb-50">
    <div name="table wrapper" class="w-full px-20 h-fit">
      <div name="buttonWrapper" class="w-full h-fit grid">
        <a href="{{ url('adminProductDetail') }}" class="w-fit bg-black text-white rounded-lg p-3" >+ Add Item</a>
      </div>
      <table  class="w-full table-fixed">
        <thead class="gap-5 ">
          <td></td>
          <td><span>Category</span></td>
          <td><span>Name</span></td>
          <td><span>Price</span></td>
          <td><span>Stock</span></td>
          <td><span>Edit</span></td>
          <td><span>Delete</span></td>
        </thead>
        <tbody name="itemDisplay" id="itemDisplay">

        </tbody>
      </table>

      <button onclick="loadMoreItems()" type="" class="p-2 border-2 rounded-lg">Load More</button>

    </div>
  </main>
@vite('resources/js/displayAdminItems.js')
<script>
let currentCount = 0;
const itemsPerLoad = 8;
document.addEventListener("DOMContentLoaded", () => {
    loadMaxImages('itemDisplay', itemsPerLoad);
});
function loadMoreItems() {
    currentCount += itemsPerLoad;
    loadMaxImages('itemDisplay', itemsPerLoad, null, null, null, currentCount, null);
}

</script>
@endsection
