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

    public function report_pembayaran()
    {
        $member = DB::table('invoices as in') ->join('users as u' , 'in.user_id', '=', 'u.id')
        ->join('plans as p', 'in.plan_id', '=', 'p.id')
        ->join('method_payments as mp', 'in.method_payment_id', '=', 'mp.id')
        ->select('in.id', 'in.user_id', 'u.name as user_name', 'mp.name as mp_name', 'p.name as plan_name', 'in.verified_at', 'in.pending_amount', 'in.status')
        ->get();
        $verified_by = DB::table('invoices as in') ->join('users as u', 'in.verified_by', '=', 'u.id')
        ->select('u.name')
        ->where('u.level', '=', 1)
        ->get();
        return view('dashboard.admin.member.report_pembayaran', compact('member', 'verified_by'));
    }

    public function report_data_member()
    {
        $members = DB::table('data_member')->get();
        return view('dashboard.admin.member.report_data_member', compact('members'));
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
