<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Cart extends Model
{
    use HasUuids;
    //

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function products() {
        return $this->belongsToMany(Products::class, 'product_carts', 'cart_id', 'product_id')
            ->withPivot('quantity', 'size')
            ->withTimestamps();
    }
}
