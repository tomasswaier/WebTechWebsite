<?php


use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController, App\Http\Controllers\CartController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ItemController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/', [HomeController::class, 'index']);

Route::get('/allProducts', function () {
    return view('allProducts');
});
Route::get('logInPage', function () {
    return view('logInPage');
});
Route::get('registerPage', function () {
    return view('registerPage');
});

//Route::get('adminAllProducts', function () {
//    return view('adminAllProducts');
//})->name('admin.all.products');
//Route::get('adminProductDetail', function () {
//    return view('adminProductDetail');
//});
Route::middleware(['auth', 'is_admin'])->group(function () {
    Route::get('adminAllProducts', function () {
        return view('adminAllProducts');
    })->name('admin.all.products');

    //Route::prefix('api')->group(function () {
    //    Route::get('/adminItems', [AdminItemController::class, 'loadItemInfo']);
    //});
    Route::get('adminProductDetail', function () {
        return view('adminProductDetail');
    })->name('admin.product.detail');
    Route::get('adminProductDetail/{id}', function ($id) {
        return view('adminProductDetail', ['productId' => $id]);
    })->name('admin.product.detail');
    //Route::get('adminProductDetail/{id}',[ProductController::class,'detail']);
});

Route::get('cartAddressInfo', function () {
    return view('cartAddressInfo');
});
Route::get('cartAddressInfo', [CartController::class, 'overview'])->name('cartOverview');
Route::get('cart/', [CartController::class, 'overview'])->name('cartOverview');
Route::post('cart/delete/{product_id}', [CartController::class, 'delete'])->name('cart.delete');
Route::post('cart/change/{product_id}', [CartController::class, 'change'])->name('cart.change');
Route::get('cartPayment', function () {
    return view('cartPayment');
});
Route::get('productDetail/{id}', function ($id) {
    return view('productDetail', ['productId' => $id]);
});
Route::get('productDetail/{id}',[ProductController::class,'detail']);

Route::get('/product/detail/{id}', [ProductController::class, 'detail'])->name('product.detail');

Route::post('/cart/add/{product_id}', [CartController::class, 'add'])->name('cart.add');

Route::prefix('api')->group(function () {
    Route::get('/items', [ItemController::class, 'getFilteredItems']);
    Route::get('/products/{product_id}/images', [ItemController::class, 'getItemImages']);
    Route::get('/items/{count?}', [ItemController::class, 'getMainPicture'])->where('count', '[0-9]+');
    Route::get('/cartItems/{count?}', [ItemController::class, 'getUserCartItems'])->where('count', '[0-9]+');

});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
