<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Licence;
use App\Models\LicenceType;
use App\Models\User;

class LicenceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Licence::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::factory(),
            'licence_type_id' => LicenceType::factory(),
            'start_at' => $this->faker->dateTime(),
            'end_at' => $this->faker->dateTime(),
            'active' => $this->faker->boolean,
        ];
    }
}
