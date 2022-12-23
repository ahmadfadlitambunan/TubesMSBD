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
            $table->timestamp('expired_at');
            $table->foreignId('method_payment_id')->references('id')->on('method_payments');
            $table->integer('pending_amount');
            $table->enum('status', [0, 1, 2, 3])->nullable()->comment('0 = Invalid, 1 = Sukses, 2 = Partial, 3 = Overpaid, NULL = belum diverifikasi');
            $table->foreignId('verified_by')->nullable();
            $table->timestamp('verified_at')->nullable();
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
