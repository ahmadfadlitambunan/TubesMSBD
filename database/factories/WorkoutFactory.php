<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Workout>
 */
class WorkoutFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'goal_id' => fake()->numberBetween(1, 4),
            'created_by' => fake()->numberBetween(1, 5),
            'name' => fake()->sentence(2),
            'image'=> "images/about/img-1.jpg",
        ];
    }
}
