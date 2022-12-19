<?php

namespace App\Http\Controllers\WEB;

use App\Models\Muscle;
use App\Models\Exercise;
use App\Models\Equipment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExerciseController extends Controller
{
    public function index() {
        
        $latihan = Exercise::with(['muscles', 'equipments'])->get();

        return view('latihan.gerakan-latihan', [
            'exercises' => $latihan,
            'muscles' => Muscle::all(),
            'equips' => Equipment::all()
        ]);
    }   
}
