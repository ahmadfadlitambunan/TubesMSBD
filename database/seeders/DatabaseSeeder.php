<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Goal;
use App\Models\Plan;
use App\Models\User;
use App\Models\Muscle;
use App\Models\Workout;
use App\Models\BodyArea;
use App\Models\Exercise;
use App\Models\Equipment;
use App\Models\MethodPayment;
use App\Models\ExerciseMuscle;
use Illuminate\Database\Seeder;
use App\Models\OlympusEquipment;
use App\Models\ExerciseEquipment;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Goal::factory(4)->create();
        Muscle::factory(20)->create();
        Equipment::factory(30)->create();
        OlympusEquipment::factory(20)->create();
        User::factory(20)->create();
        Workout::factory(20)->create();
        Plan::factory(5)->create();
        Exercise::factory(40)->create();
        ExerciseMuscle::factory(100)->create();
        ExerciseEquipment::factory(100)->create();
        
        MethodPayment::create([
            'name' => 'Gopay',
            'a_n' => 'Ahmad Fadli Tambunan',
            'account_no' => '081316616546',
        ]);

        MethodPayment::create([
            'name' => 'BNI',
            'a_n' => 'Bang Tito',
            'account_no' => '1713561564',
        ]);
        
        MethodPayment::create([
            'name' => 'BRI',
            'a_n' => 'Bang Gihon',
            'account_no' => '844648464',
        ]);
    }
}
