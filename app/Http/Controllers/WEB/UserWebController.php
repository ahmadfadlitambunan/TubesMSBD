<?php

namespace App\Http\Controllers\WEB;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UserWebController extends Controller
{
    // Get Profile user
    public function index() {
        return view('profile.index');
    }

    //edit profile user
    public function edit() {
        return view('profile.edit-profile');
    }

    //history pembelian oleh user
    public function history() {
        $result = DB::select("SELECT * FROM histories_invoice WHERE buyer_id = ?", [Auth::user()->id]);


        return view('profile.history', [
            'histories' => $result
        ]);
    }
}
