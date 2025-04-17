<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImages extends Model
{
    protected $table = 'product_images';

    public function product()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }
}
