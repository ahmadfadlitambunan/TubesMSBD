<?php

namespace App\Models;

use App\Models\Invoice;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Invoice extends Model
{


    protected $guarded = ['id'];
    protected $table = 'invoices';
    use HasFactory;

    public function payments() {
        return $this->hasMany(Invoice::class);
    }
}
