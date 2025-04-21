<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

class ItemController extends Controller{
    public function getMainPicture($count = 1)
    {
        \DB::enableQueryLog();
        try {
            $products = Products::with('images')
                ->inRandomOrder()
                ->limit($count)
                ->get()
                ->map(function ($product) {
                    return [
                        'id'=>$product->id,
                        'name' => $product->name,
                        'price' => $product->price,
                        'imagePath' => $product->images->where("is_main","true")->first()->image_url
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
    public function getUserCartItems($count = 1){}
    public function getItemImages($product_id)
    {
        try {
            $product = Products::find($product_id);
            if (!$product) {
                return response()->json([
                    'error' => 'Product not found'
                ], 404);
            }

            $images = $product->images()
                ->get()
                ->map(function ($image) {
                    return [
                        'image_url' => asset("product_images/{$image->image_url}"),
                        'is_main' => $image->is_main
                    ];
                });
            //return response()->json([
            //    'product_id' => "2c3226eb-2cfc-4ec7-8ef8-71c4268480c5",
            //    'product_name' => "name uwu",
            //    'images' => [
            //        [
            //            'imagePath' => "http://localhost:8000/product_images/example_shirt_front.png",
            //            'is_main' => true
            //        ]
            //    ]
            //]);
            return response()->json([
                'product_id' => $product_id,
                'product_name' => $product->name,
                'images'=>$images,
                ]);

        } catch (\Exception $e) {
            \Log::error('Item Images API Error:', [
                'product_id' => $product_id,
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'product_id' => "2c3226eb-2cfc-4ec7-8ef8-71c4268480c5",
                'product_name' => "name uwu",
                'images' => [
                    [
                        'imagePath' => "http://localhost:8000/product_images/example_shirt_front.png",
                        'is_main' => true
                    ]
                ]
            ]);
        }
    }
}
