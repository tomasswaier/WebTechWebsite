<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

class ItemController extends Controller{
    public function getItems($count = 1)
    {
        \DB::enableQueryLog();
        //return [
        //    [
        //    'name' => "MeOW",
        //    'price' => 19.99,
        //    'imagePath' => "example_shirt_front.png"
        //    ]
        //];
        try {
            $products = Products::with('images')
                ->inRandomOrder()
                ->limit($count)
                ->get()
                ->map(function ($product) {
                    return [  // Remove the extra array wrapper here
                        'name' => $product->name,
                        'price' => $product->price,
                        'imagePath' => $product->images->isNotEmpty()
                            ? $product->images->random()->filename
                            : 'default_product.png'
                    ];
                });

            \Log::info('Executed queries:', \DB::getQueryLog());

            return response()->json($products);

        } catch (\Exception $e) {
            \Log::error('API Error:', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'error' => 'Server error',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
