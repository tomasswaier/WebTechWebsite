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
}
