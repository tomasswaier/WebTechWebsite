<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Category extends Model
{
    use HasUuids;
    protected $fillable = ['name'];
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    //
}
