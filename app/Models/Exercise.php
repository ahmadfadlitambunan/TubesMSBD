<?php

namespace App\Models;

use App\Models\Muscle;
use App\Models\Equipment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Exercise extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    protected $table = 'exercises';
    protected $with = ['muscles', 'equipments'];
    
    public function scopeFilter($query, array $filters)
    {     
        $query->when($filters['search'] ?? false, function($query, $search){
            return $query->where('title', 'like', '%' . $search . '%')
            ->orWhere('body', 'like', '%' . $search . '%');
        });
            
        $query->when($filters['muscles'] ?? false, function($query, $muscles){
            return $query->whereHas('muscles', function($query) use($muscles){
                $query->whereIn('id', $muscles);
            });
        });
        
        $query->when($filters['equipments'] ?? false, function($query, $equipments){
            return $query->whereHas('equipments', function($query) use($equipments){
                $query->whereIn('id', $equipments);
            });
        });
    } 





    public function muscles()
    {
        return $this->belongsToMany(Muscle::class, 'exercise_muscles', 'exercise_id', 'muscle_id');
    }

    public function equipments()
    {
        return $this->belongsToMany(Equipment::class, 'exercise_equipments', 'exercise_id', 'equipment_id');
    }
}
