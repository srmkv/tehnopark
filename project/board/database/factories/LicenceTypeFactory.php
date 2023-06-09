<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\LicenceType;

class LicenceTypeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = LicenceType::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(4),
            'desc' => $this->faker->text,
            'pupils' => $this->faker->numberBetween(-10000, 10000),
            'active' => $this->faker->boolean,
            'price' => $this->faker->randomFloat(2, 0, 999999.99),
        ];
    }
}
