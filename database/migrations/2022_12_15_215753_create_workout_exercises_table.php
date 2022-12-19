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
        Schema::create('workout_exercises', function (Blueprint $table) {
            $table->foreignId('exercise_id')->references('id')->on('exercises')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('workout_id')->references('id')->on('workouts')->onUpdate('cascade')->onDelete('cascade');
            $table->integer('sets');
            $table->integer('reps')->nullable();
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
        Schema::dropIfExists('workout_exercises');
    }
};
