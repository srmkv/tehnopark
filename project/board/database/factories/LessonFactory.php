<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\User;

class LessonFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Lesson::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(4),
            'slug' => $this->faker->slug,
            'desc' => $this->faker->text,
            'start_at' => $this->faker->dateTime(),
            'status' => $this->faker->numberBetween(-10000, 10000),
            'course_id' => Course::factory(),
            'user_id' => User::factory(),
            'pad_secret' => $this->faker->word,
            'pad_json' => $this->faker->text,
        ];
    }
}
