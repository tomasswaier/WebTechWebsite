<?php
namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;
class HomeController extends Controller{
    public function index()
    {
        $newArrivals = Products::with(['images', 'category'])
            ->orderBy('created_at', 'desc')
            ->take($this->calculateItemCount())
            ->get()
            ->map(function ($product) {
                return $this->formatProductData($product);
            });

        $onSaleItems = Products::with(['images', 'category'])
            ->whereColumn('discounted_price', '<', 'price')
            ->orderBy('discounted_price', 'asc')
            ->take($this->calculateItemCount())
            ->get()
            ->map(function ($product) {
                return $this->formatProductData($product);
            });

        return view('welcome', [
            'newArrivals' => $newArrivals,
            'onSaleItems' => $onSaleItems
        ]);
    }

    protected function calculateItemCount()
    {
        return 10;
    }

    protected function formatProductData($product)
    {
        return [
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->discounted_price ?: $product->price,
            'imagePath' => asset('product_images/' . $product->images->firstWhere('is_main', true)->image_url),
            'originalPrice' => $product->discounted_price ? $product->price : null
        ];
    }
}
