<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Shipping extends Model
{
    use HasUuids, hasFactory;
    //

    protected $fillable = ['name', 'price'];
}
