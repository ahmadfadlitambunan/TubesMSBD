<?php

namespace App\Http\Controllers\WEB;

use Auth;
use App\Models\Goal;
use App\Models\Muscle;
use App\Models\Workout;
use App\Models\Exercise;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Equipment;

class LatihanController extends Controller
{
    // Menampilkan latihan
    public function index() {
        return view('latihan.index', [
            'workouts' => Workout::all(),
            'goals' => Goal::all()
        ]);
    }

    public function saveWorkout(Request $request) {
        $validated = $request->validate([
            'name' => 'required|max:255',
            'goal' => 'required',
            'image' => 'image|max:1024',
        ]);

        if($request->file('image')) {
            $validated['image'] = $request->file('image')->store('workout_images');

            $result = Workout::create([
                'name' => $validated["name"],
                'goal_id' => $validated["goal"],
                'created_by' => Auth::user()->id,
                'image' => $validated['image']
            ]);
        } else {
            $result = Workout::create([
                'name' => $validated["name"],
                'goal_id' => $validated["goal"],
                'created_by' => Auth::user()->id,
            ]);
        }

        return redirect(route('gerakan-Latihan', ['wid' => $result->id, 'action' => 'add_exist_workout']));
    }

    public function show(Workout $workout) {
       foreach ($workout->with('exercises')->get() as $latihan) {
       }
       return view('latihan.latihan', [
            'workout' => $latihan
       ]);
    }

    public function exercise() {
        return view('latihan.gerakan', [
            'exercises' => Exercise::with(['muscles', 'equipments'])->get(),
            'muscles' => Muscle::all(),
            'equips' => Equipment::all()
        ]);
    }
    
    public function showExercise(Exercise $exercise) {
        return view('latihan.gerakan-show', [
            'exercise' => $exercise
        ]);
    }


}
