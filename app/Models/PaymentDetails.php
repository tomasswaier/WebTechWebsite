<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class PaymentDetails extends Model
{
    use HasUuids;

    protected $fillable = ['payment_method'];
}
