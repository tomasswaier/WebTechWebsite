<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ShippingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('shippings')->insert([
            'id' => Str::uuid(),
            'name' => 'SPS',
            'price' => 5.00,
        ]);
        DB::table('shippings')->insert([
            'id' => Str::uuid(),
            'name' => 'GLS',
            'price' => 4.00,
        ]);
        //
    }
}
