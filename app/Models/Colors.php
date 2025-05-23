<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Colors extends Model
{
    use HasUuids;
    public function uniqueColors()
    {
        return $this->belongsTo(Category::class);
    }
    //
}
