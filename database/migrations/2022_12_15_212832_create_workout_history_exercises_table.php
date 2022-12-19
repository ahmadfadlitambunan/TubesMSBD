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
        Schema::create('workout_history_exercises', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workout_history_id')->references('id')->on('workout_histories')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('exercise_id')->references('id')->on('exercises')->onUpdate('cascade')->onDelete('cascade');
            $table->integer('reps');
            $table->integer('weights')->nullable();
            $table->integer('time_seconds')->nullable();
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
        Schema::dropIfExists('workout_history_exercises');
    }
};
