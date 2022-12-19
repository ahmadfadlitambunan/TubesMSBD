<?php

namespace App\Http\Controllers\WEB;

use App\Models\Goal;
use App\Models\Workout;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

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

        return redirect(route('gerakan-latihan', ['wid' => $result->id, 'action' => 'add_exist_workout']));
    }
}
