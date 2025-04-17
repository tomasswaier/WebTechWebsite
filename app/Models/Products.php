<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $table = 'products';

    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_id');
    }
}
