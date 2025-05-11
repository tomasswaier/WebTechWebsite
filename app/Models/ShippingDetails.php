<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class ShippingDetails extends Model
{
    use hasUuids;
    //

    protected $fillable = ['user_id', 'city', 'zip', 'address','country', 'first_name', 'last_name'];
}
