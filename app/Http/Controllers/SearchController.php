<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;


class SearchController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search', '');

        $products = Product::with(['images', 'category'])
            ->where('title', 'like', '%' . $search . '%')
            ->orWhere('longDescription', 'like', '%' . $search . '%')
            ->orWhere('shortDescription', 'like', '%' . $search . '%')
            ->latest()
            ->take(config("app.items_per_page"))
            ->get();

        return view('search', [
            'products' => $products,
            'searchText' => $search,
        ]);
    }
}
