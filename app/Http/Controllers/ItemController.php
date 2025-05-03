<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

class ItemController extends Controller{
    public function getMainPicture($count = null)  // Made count optional
    {
        try {
            $query = Products::with('images')->inRandomOrder();

            if ($count) {
                $query->limit($count);
            }

            $products = $query->get()->map(function ($product) {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'price' => $product->price,
                    'imagePath' => asset("product_images/{$product->images->where("is_main", "true")->first()->image_url}")
                ];
            });

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

    public function getFilteredItems(Request $request)
    {
        try {
            $query = Products::with(['images', 'category']);

            if ($request->has('category') && $request->category !== 'all') {
                $query->whereHas('category', fn($q) => $q->where('name', $request->category));
            }

            if ($request->has('price') && is_numeric($request->price)) {
                $query->where('price', '<=', (float)$request->price);
            }

            if ($request->has('search') && !empty($request->search)) {
                $search = $request->search;
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%");
                });
            }

            switch ($request->input('sort', 'oldest')) {
                case 'newest':
                    $query->orderBy('created_at', 'desc');
                    break;
                case 'price-highest':
                    $query->orderBy('price', 'desc');
                    break;
                case 'price-lowest':
                    $query->orderBy('price', 'asc');
                    break;
                default: // oldest
                    $query->orderBy('created_at', 'asc');
            }

            $count = (int)$request->input('count', 0);
            $load = (int)$request->input('load', 8);

            $totalItems = $query->count();
            $items = $query->skip($count)
                          ->take($load)
                          ->get()
                          ->map(function ($product) {
                              return [
                                  'id' => $product->id,
                                  'name' => $product->name,
                                  'category' => $product->category->name,
                                  'price' => $product->price,
                                  'imagePath' => asset("product_images/{$product->images->where('is_main', true)->first()->image_url}"),
                                  'stock'=>$product->in_stock
                              ];
                          });

            return response()->json([
                'items' => $items,
                'total' => $totalItems,
                'next_count' => $count + $load,
                'has_more' => ($count + $load) < $totalItems
            ]);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

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
