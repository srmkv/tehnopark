<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Licence;
use App\Models\Transaction;
use App\Models\User;

class TransactionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Transaction::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'amount' => $this->faker->randomFloat(2, 0, 999999.99),
            'tx' => $this->faker->word,
            'type' => $this->faker->randomElement(["deposit","buy"]),
            'desc' => $this->faker->word,
            'user_id' => User::factory(),
            'licence_id' => Licence::factory(),
            'status' => $this->faker->randomElement(["pending","successful","failed"]),
        ];
    }
}
