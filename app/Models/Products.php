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

    protected $fillable = [
        'name',
        'description',
        'category_id',
        'price',
        'in_stock',
        'discounted_price',
        'color'
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'discounted_price' => 'decimal:2',
        'in_stock' => 'integer'
    ];

    protected $attributes = [
        'in_stock' => 0,
        'discounted_price' => null
    ];

    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public static function uniqueColors()
    {
        return self::query()
            ->select('color')
            ->distinct()
            ->whereNotNull('color')
            ->pluck('color');
    }
}
