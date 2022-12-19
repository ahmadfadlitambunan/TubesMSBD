<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workout extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function exercises() {
        return $this->belongsToMany(Exercise::class, 'workout_exercises', 'workout_id', 'exercise_id')
                ->withTimestamps()
                ->withPivot(['sets', 'reps', 'time_seconds']);
    }
}
