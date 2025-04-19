<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Products extends Model
{
    use HasUuids;

    protected $table = 'products';
    protected $keyType = 'string';
    public $incrementing = false;

    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_id');
    }
}
