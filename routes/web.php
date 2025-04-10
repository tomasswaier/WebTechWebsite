<?php

use Illuminate\Support\Facades\Route;

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
