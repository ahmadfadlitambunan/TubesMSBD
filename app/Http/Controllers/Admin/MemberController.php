<?php

namespace App\Http\Controllers\Admin;

use App\Models\Goal;
use App\Models\Plan;
use Illuminate\Http\Request;
use App\Models\MethodPayment;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;


class MemberController extends Controller
{
    // Get rekord member aktiv
    public function index() {
        $result = DB::select('SELECT * FROM view_member_aktif WHERE status = ?', [1]);
        return view('dashboard.admin.member.index', [
            'members' => $result
        ]);
    }

    public function indexALL() {
        $result = DB::select('SELECT * FROM view_member_aktif');
        return view('dashboard.admin.member.all', [
            'members' => $result
        ]);
    }
    
    // get inactive member
    public function indexInactive() {
        $result = DB::select('SELECT * FROM view_member_aktif WHERE status = ?', [0]);
        return view('dashboard.admin.member.inactive', [
            'members' => $result
        ]);
    }

    public function create() {
        return view('dashboard.admin.member.create', [
            'goals' => Goal::all(),
            'plans' => Plan::all(),
            'methodPays' => MethodPayment::all()
        ]);
    }

    public function ajaxHarga(Request $request) {
        $price = Plan::select('price')->where('id', '=', $request->pid)->limit(1)->get();
        return $price[0];
    }

    public function makeMembership(Request $request) {
        return $request;
    }
}
