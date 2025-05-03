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

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function colors()
    {
        return $this->belongsTo(Colors::class, 'color_id', 'id');
    }
    protected $fillable = [
        'category_id',
        'name',
        'description',
        'in_stock',
        'price',
        'discounted_price',
        'color_id'

    ];
}
