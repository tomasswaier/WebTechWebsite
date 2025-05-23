<?php

namespace App\Http\Controllers;

use App\Models\Products;
use App\Models\ProductImages;
use App\Models\ProductColor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function getUniqueColors(){
        $colors= \App\Models\Products::uniqueColors();


        return view('allProducts',['colors'=>$colors]);
    }
    public function create()
    {
        //while creating new product you need categories
        try{
            $categories = \App\Models\Category::all(); // Fetch all categories

            return view('adminProductDetail', ['categories' => $categories]);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }

    }
    public function edit($product_id)
    {
        // displays edited product. Does not save edits of a product
        try{
            $categories = \App\Models\Category::all(); // Fetch all categories
            $product=Products::find($product_id);

            $images = $product->images()
                ->get()
                ->map(function ($image) {
                    return [
                        'image_url' => asset("{$image->image_url}"),
                        'is_main' => $image->is_main
                    ];
                });

            return view('adminProductDetail', [
            'product' => $product,
            'images' => $images,
            'categories' => $categories,
            ]);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }

    }
    public function store(Request $request)
    {
        \Log::info('Starting product store method');
        \Log::debug('Request data:', $request->all());

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
            'price' => 'required|numeric|min:0',
            'discounted_price' => 'nullable|numeric|min:0',
            'in_stock' => 'required|integer|min:0',
            //'images' => 'required|array|min:1',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'color' => 'required|string|max:7',
        ]);
        \Log::debug('Validated data:', $validated);
        try {


            $product = Products::create([
                'name' => $validated['name'],
                'description' => $validated['description'],
                'category_id' => $validated['category_id'],
                'price' => $validated['price'],
                'discounted_price' => $validated['discounted_price'] ?? null,
                'in_stock' => $validated['in_stock'],
                'color' => $validated['color'],
            ]);
            \Log::info("Product created with ID: {$product->id}");


            if ($request->hasFile('images')) {
                \Log::info('Files detected: '.count($request->file('images')));
                $previmg=NULL;
                foreach ($request->file('images') as $key => $image) {
                    \Log::debug("Processing image {$key}", [
                        'original_name' => $image->getClientOriginalName(),
                        'size' => $image->getSize(),
                        'mime' => $image->getMimeType()
                    ]);
                    if ($previmg==$image) {
                        break;
                    }
                    $isMain = $key === 0; // First image is main
                    $index = $key + 1; // Start index at 1

                    // Generate custom filename
                    $filename = $product->id.'_'.($isMain ? 'true' : 'false').'_'.$index.'.'.$image->getClientOriginalExtension();

                    \Log::debug("Attempting to store as: {$filename}");

                    // Store with custom name
                    $path = $image->storeAs(
                        '',
                        $filename,
                        'public' // Store in public disk
                    );

                    ProductImages::create([
                        'product_id' => $product->id,
                        'image_url' => $path,
                        'is_main' => $isMain
                    ]);
                    $previmg=$image;

                    \Log::debug("Image record created");

                }
            }else {
                    \Log::info("no image files found");
            }

            return redirect('adminAllProducts')->with('success', 'Product created!');
        } catch (\Exception $e) {
            \Log::error('Product creation failed: '.$e->getMessage(), [
            'trace' => $e->getTraceAsString()
            ]);
        }
    }

    public function editProduct($id, Request $request)
    {
        \Log::info('Request id:', ['id' => $id]);
        \Log::info('Starting product edit method');
        \Log::info('Request data:', $request->all());

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
            'price' => 'required|numeric|min:0',
            'discounted_price' => 'nullable|numeric|min:0',
            'in_stock' => 'required|integer|min:0',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'color' => 'required|string|max:7',
        ]);

        \Log::debug('Validated data:', $validated);

        try {
            $product = Products::findOrFail($id);

            // Update product details
            $product->update([
                'name' => $validated['name'],
                'description' => $validated['description'],
                'category_id' => $validated['category_id'],
                'price' => $validated['price'],
                'discounted_price' => $validated['discounted_price'] ?? null,
                'in_stock' => $validated['in_stock'],
                'color' => $validated['color'],
            ]);

            // Handle image updates
            $storedImages = $request->input('stored_images', []);
            $existingImages = $product->images;
            $hasMainImage = false;

            // Delete images not in stored_images
            foreach ($existingImages as $image) {
                if (!in_array($image->image_url, $storedImages)) {
                    if ($image->is_main) {
                        $hasMainImage = true;
                    }
                    Storage::disk('public')->delete($image->image_url);
                    $image->delete();
                } else {
                    if ($image->is_main) {
                        $hasMainImage = true;
                    }
                }
            }

            // If main image was deleted, set a new one
            if (!$hasMainImage && count($storedImages) > 0) {
                // Set first stored image as main
                $newMainImage = $product->images()
                    ->where('image_url', $storedImages[0])
                    ->first();

                if ($newMainImage) {
                    $newMainImage->update(['is_main' => true]);
                    $hasMainImage = true;
                }
            }

            // Process new uploaded images
            if ($request->hasFile('images')) {
                $previmage=NULL;
                foreach ($request->file('images') as $key => $image) {
                    if ($previmage==$image) {
                        break;
                    }
                    $isMain = (!$hasMainImage && $key === 0);

                    $filename = $product->id.'_'.($isMain ? 'main' : 'sub').'_'.time().'.'.$image->getClientOriginalExtension();
                    $path = $image->storeAs('', $filename, 'public');

                    ProductImages::create([
                        'product_id' => $product->id,
                        'image_url' => $path,
                        'is_main' => $isMain
                    ]);

                    if ($isMain) {
                        $hasMainImage = true;
                    }
                    $previmage=$image;
                }
            }

            // If no main image exists at all, set the first available image as main
            if (!$hasMainImage) {
                $firstImage = $product->images()->first();
                if ($firstImage) {
                    $firstImage->update(['is_main' => true]);
                }
            }

            return redirect('adminAllProducts')->with('success', 'Product updated successfully!');
        } catch (\Exception $e) {
            \Log::error('Product update failed: '.$e->getMessage(), [
                'trace' => $e->getTraceAsString()
            ]);
            return back()->with('error', 'Failed to update product');
        }
    }

    public function detail($id)
    {
        $product = Products::with(['category', 'images'])->findOrFail($id);
        $mainImage = $product->images->firstWhere('is_main', true);

        return view('productDetail', [
            'product' => $product,
            'mainImage' => $mainImage,
        ]);
    }

    public function destroy($id)
    {
        try {
            $product = Products::findOrFail($id);

            // Delete associated images
            foreach ($product->images as $image) {
                Storage::disk('public')->delete($image->image_url);
                $image->delete();
            }

            $product->delete();

            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            \Log::error('Product deletion failed: '.$e->getMessage());
            return response()->json(['success' => false], 500);
        }
    }
}
