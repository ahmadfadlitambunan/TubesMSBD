<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Workout;
use App\Models\Exercise;
use App\Models\WorkoutExercise;
use Auth;
use \Exception;

class AjaxController extends Controller
{
    // Return Modal
    public function ajaxModal(Request $request) {
        if(request('action') == "add_exist_workout") {
            return view('ajax.exist-workout', [
                'Nworkout' => Workout::find(request('wid')),
                'Eexercise' => Exercise::find(request('eid'))
            ]);
        } elseif (request('action') == "add_to_workout") {
            return view('ajax.to-workout', [
                'Sworkouts' => Workout::where('created_by', Auth::user()->id)->get(),
                'Eexercise' => Exercise::find(request('eid'))
            ]);
        } elseif(request('action') == "save_exercise") {
            if(isset($request['times'])) {
                try {
                    Workout::find(request('wid'))->exercises()
                    ->attach(request('eid'), [
                        'sets' => request('sets'),
                        'time_seconds' => request('times')
                    ]);

                    return "sukses";
                } catch(Exception $e) {
                    return "<script>Swal.fire({
                        icon: 'failed',
                        title: 'Gerakan Latihan Gagal Ditambahkan',
                        text: 'Latihan sudah ada di Program Latihan',
                        showConfirmButton: true,
                      })</script>";
                }

            } elseif(isset($request['reps'])) {
                try {
                    Workout::find(request('wid'))->exercises()
                    ->attach(request('eid'), [
                        'sets' => request('sets'),
                        'reps' => request('reps')
                    ]);

                    return "Sukses";
                } catch(Exception $e) {
                    return $e->getMessage();
                }
            }
        }
    }



    public function filterAjax(Request $request) {

        return view('ajax.filter-ajax', [
            'exercises' => Exercise::filter(request(['search', 'muscles', 'equipments']))->get()
        ]);
    }
    
}
