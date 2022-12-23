<?php

namespace App\Http\Controllers\Admin;

use App\Models\Muscle;
use App\Models\Exercise;
use App\Models\Equipment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;


class CmsExerciseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('dashboard.admin.master-data.gerakan.index', [
            'exercises' => Exercise::with('muscles', 'equipments')->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.admin.master-data.gerakan.create', [
            'muscles' => Muscle::all(),
            'equipments' => Equipment::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'desc' => 'required',
            'muscles' => 'required',
            'equipments' => 'required',
            'image' => 'required|image|file|mimes:jpeg,png,jpg,gif,svg|max:1024'
        ]);   
        
        DB::beginTransaction();

        try {
            if($request->file('image')) {
                $validatedData['image'] = $request->file('image')->store('exercise-images');
            }

            $exercise = Exercise::create([
                'name' => $validatedData['name'],
                'desc' => $validatedData['desc'],
                'image' => $validatedData['image']
            ]); 
    
            $exercise->muscles()->sync(
                $request->muscles
            );
            
            $exercise->equipments()->sync(
                $request->equipments
            );
            DB::commit();
            return redirect()->route('exercise.index')->with('success', "Data Berhasil Ditambahkan");

        } catch (\Exception $e) {
            DB::rollback();
            return back()->with('error', "Data gagal ditambahkan, silahkan coba lagi");
        }
 

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function show(Exercise $exercise)
    {
        return view('dashboard.admin.master-data.gerakan.show', [
            'exercise' => $exercise
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function edit(Exercise $exercise)
    {
        return view('dashboard.admin.master-data.gerakan.edit', [
            'exercise' => $exercise,
            'muscles' => Muscle::all(),
            'equipments' => Equipment::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Exercise $exercise)
    {
        $rules = [
            'name' => 'required|max:255',
            'desc' => 'required',
            'muscles' => 'required',
            'equipments' => 'required',
            'image' => 'required|image|file|mimes:jpeg,png,jpg,gif,svg|max:1024'
        ];

        DB::beginTransaction();
        try {

            $validatedData = $request->validate($rules);

            if($request->file('image')) {
                if($request->oldImage) {
                    Storage::delete($request->oldImage);
                }
                $validatedData['image'] = $request->file('image')->store('exercise-images');
            }

            $exercise->update([
                $exercise->name = $validatedData['name'],
                $exercise->desc = $validatedData['desc'],
                $exercise->image = $validatedData['image'],
            ]);

    
            $exercise->muscles()->sync(
                $request->muscles
            );
            
            $exercise->equipments()->sync(
                $request->equipments
            );

            DB::commit();
            return redirect()->route('exercise.index')->with('success', "Data Berhasil Ditambahkan");

        } catch (\Exception $e) {
            DB::rollback();
            return back()->with('error', "Data gagal ditambahkan, silahkan coba lagi");
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Exercise  $exercise
     * @return \Illuminate\Http\Response
     */
    public function destroy(Exercise $exercise)
    {
        //
    }
}
