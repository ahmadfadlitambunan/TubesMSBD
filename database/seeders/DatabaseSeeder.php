<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Plan;
use App\Models\User;
use App\Models\MethodPayment;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(20)->create();
        Plan::factory(5)->create();

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
