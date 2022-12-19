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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->foreignId('goal_id')->nullable()->references('id')->on('goals')->onUpdate('cascade')->onDelete('set null');
            $table->string('qr_code');
            $table->string('name');
            $table->string('username')->unique();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('no_phone')->unique();
            $table->string('password');
            $table->enum('gender', [1, 2]); // 1 = Laki - Laki dan 2 = Perempuan
            $table->string('address')->nullable();
            $table->enum('level', [1, 2]); // 1 = Admin dan 2 = Olympian
            $table->string('image');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
};
