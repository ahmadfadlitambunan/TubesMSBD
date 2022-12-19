<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ExerciseMuscle>
 */
class ExerciseMuscleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'exercise_id' => fake()->numberBetween(1, 40),
            'muscle_id' => fake()->numberBetween(1, 20),
        ];
    }
}
