<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->references('id')->on('users');
            $table->foreignId('plan_id')->references('id')->on('plans');
            $table->foreignId('id_method_payment')->references('id')->on('method_payments')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamp('expired_at');
            $table->string('image')->nullable();
            $table->enum('status', [0, 1, 2, 3])->default('0'); // 0 = belum dibayar, 1 = Pembayaran sukses, 2 = Nominal Kurang, 3 = pembayaran invalid.
            $table->foreignId('verified_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('invoices');
    }
};
