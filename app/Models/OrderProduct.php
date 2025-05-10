<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class OrderProduct extends Model
{
    use HasUuids;
    //
    protected $fillable = ['order_id', 'product_id', 'quantity'];
}
