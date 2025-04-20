<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ItemController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/allProducts', function () {
    return view('allProducts');
});
Route::get('logInPage', function () {
    return view('logInPage');
});
Route::get('registerPage', function () {
    return view('registerPage');
});
Route::get('adminAllProducts', function () {
    return view('adminAllProducts');
});
Route::get('adminProductDetail', function () {
    return view('adminProductDetail');
});
Route::get('cartAddressInfo', function () {
    return view('cartAddressInfo');
});
Route::get('cartOverview', function () {
    return view('cartOverview');
});
Route::get('cartPayment', function () {
    return view('cartPayment');
});
Route::get('productDetail', function () {
    return view('productDetail');
});

Route::get('/api/items/{count?}', [ItemController::class, 'getMainPicture'])
    ->where('count', '[0-9]+');

Route::get('/product/detail/{id}', [ProductController::class, 'detail'])->name('product.detail');

//Route::get('/dashboard', function () {
//    return view('dashboard');
//})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
