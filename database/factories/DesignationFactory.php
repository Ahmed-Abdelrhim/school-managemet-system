<?php

namespace Database\Factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use function PHPUnit\Framework\countOf;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Designation>
 */
class DesignationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $titles = ['Front-End Developer','Back-End Developer','Mobile Developer','Security','Software Tester','Ui/Ux','Graphic Designer','Data Analyst'];
        return [
            'name' => $titles[$this->faker->numberBetween(0,count($titles) - 1 )],
            'created_at' => Carbon::now(),
        ];
    }
}
