<?php

namespace Database\Factories;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = User::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $genders = ['Male','Female'];
        $religions = ['Muslim','Christian','Jewish','Atheist'];
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'email_verified_at' => Carbon::now(),
            'password' => bcrypt('12345678'), // password
            'remember_token' => Str::random(10),
            'mobile' => '01'.$this->faker->numberBetween(0,2) . $this->faker->numberBetween(0000000,9999999),
            'usertype' => 'Admin',
            'address' => $this->faker->address,
            'gender' => $genders[$this->faker->numberBetween(0,1)],
            'image' => '202301291300myPic-1.jpg',
            'religion' => $religions[$this->faker->numberBetween(0,3)],
            'dob' => $this->faker->dateTimeBetween('1970-01-01', '2012-12-31'),
            'role' => 'Operator',
            'created_at' => Carbon::now(),
        ];
    }
}
