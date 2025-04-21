<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

class ProductController extends Controller
{

    public function detail($id, Request $request)
    {

        $product = Products::with(['category', 'images', 'colors'])->where('id', $id)->firstOrFail();

        $mainImage = $product->images->firstWhere('is_main', true);

        return view('productDetail', [
            'product' => $product,
            'mainImage' => $mainImage,
        ]);
    }
    //
}
