<?php

namespace App\Http\Controllers;

use App\Models\Products;
use App\Models\ProductImage;
use App\Models\ProductColor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function create()
    {
        try{
            $categories = \App\Models\Category::all(); // Fetch all categories

            return view('adminProductDetail', ['categories' => $categories]);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }

    }
    // In your ProductController (or create a new controller if needed)
    public function edit($product_id)
    {
        try{
            $categories = \App\Models\Category::all(); // Fetch all categories
            $product=Products::find($product_id);

            $images = $product->images()
                ->get()
                ->map(function ($image) {
                    return [
                        'image_url' => asset("product_images/{$image->image_url}"),
                        'is_main' => $image->is_main
                    ];
                });
            $color =$product->colors();





            return view('adminProductDetail', [
            'product' => $product,
            'images' => $images,
            'categories' => $categories,
            'color'=>$color,
            ]);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }

    }
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:500',
            'category_id' => 'required|exists:categories,id',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'colors' => 'sometimes|array',
        ]);

        // Create the product
        $product = Products::create([
            'name' => $validated['name'],
            'description' => $validated['description'],
            'category_id' => $validated['category_id'],
            'price' => $validated['price'],
            'stock' => $validated['stock'],
        ]);

        // Handle images
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $key => $image) {
                $path = $image->store('product_images', 'public');

                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => $path,
                    'is_main' => $key === 0 // First image is main
                ]);
            }
        }

        // Handle colors
        if ($request->has('colors')) {
            foreach ($request->colors as $color) {
                ProductColor::create([
                    'product_id' => $product->id,
                    'color_code' => $color
                ]);
            }
        }

        return redirect()->route('products.show', $product->id)
                         ->with('success', 'Product created successfully!');
    }

    public function detail($id)
    {
        $product = Products::with(['category', 'images', 'colors'])->findOrFail($id);
        $mainImage = $product->images->firstWhere('is_main', true);

        return view('productDetail', [
            'product' => $product,
            'mainImage' => $mainImage,
        ]);
    }
}
