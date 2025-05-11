<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('payment_details')->insert([
            'id' => Str::uuid(),
            'payment_method' => 'CARD',
        ]);
        DB::table('payment_details')->insert([
            'id' => Str::uuid(),
            'payment_method' => 'CASH',
        ]);
        //
    }
}
