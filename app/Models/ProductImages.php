<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class ProductImages extends Model
{
    use HasUuids;

    protected $table = 'product_images';
    protected $keyType = 'string';
    public $incrementing = false;

    public function product()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }
}
