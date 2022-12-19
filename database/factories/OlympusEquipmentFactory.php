<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\OlympusEquipment>
 */
class OlympusEquipmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'brand' => fake()->sentence(2), 
            'type' => fake()->sentence(1),
            'desc' => fake()->text(100),
            'image' => "images/about/img-1.jpg",
        ];
    }
}
