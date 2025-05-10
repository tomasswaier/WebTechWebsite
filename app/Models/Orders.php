<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Orders extends Model
{
    use HasUuids;

    protected $fillable = ['user_id', 'shipping_method', 'payment_method', 'shipping_details', 'price'];
    //
}
