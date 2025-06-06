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
Route::get('/allProducts', [ProductController::class, 'getUniqueColors'])->name('products.all');
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

    Route::prefix('adminProductDetail')->group(function () {

        Route::get('/', [ProductController::class, 'create'])
             ->name('products.create');

        Route::get('{id}', [ProductController::class, 'edit'])
             ->name('products.edit');

        Route::post('{id}', [ProductController::class, 'editProduct'])
             ->name('products.update');
    });

    Route::delete('/deleteProduct/{id}', [ProductController::class, 'destroy'])
         ->name('products.destroy');

    Route::post('products', [ProductController::class, 'store'])
         ->name('products.store');
});
Route::get('cart/address', [CartController::class, 'address_info'])->name('cart.address');
Route::post('cart/address/save', [CartController::class, 'save_address'])->name('cart.save_address');
Route::get('cart/', [CartController::class, 'overview'])->name('cartOverview');
Route::post('cart/delete/{product_id}', [CartController::class, 'delete'])->name('cart.delete');
Route::post('cart/change/{product_id}', [CartController::class, 'change'])->name('cart.change');
Route::get('cart/payment', [CartController::class, 'payment'])->name('cart.payment');
Route::post('cart/payment/confirm', [CartController::class, 'confirm_order'])->name('cart.confirm');
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
