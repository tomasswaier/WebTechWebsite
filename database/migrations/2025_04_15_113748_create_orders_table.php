<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->nullable();
            $table->uuid('shipping_method');
            $table->uuid('payment_method');
            $table->uuid('shipping_details');
            $table->decimal('price', 8, 2);
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('shipping_method')->references('id')->on('shippings')->onDelete('cascade');
            $table->foreign('payment_method')->references('id')->on('payment_details')->onDelete('cascade');
            $table->foreign('shipping_details')->references('id')->on('shipping_details')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
