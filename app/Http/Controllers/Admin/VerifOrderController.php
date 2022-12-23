<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class VerifOrderController extends Controller
{
    // Ambil data pesanan dari Tabel `orders`
    public function getUnverifiedOrder(){
        $result = DB::select("SELECT * FROM unverified_order;");
       
        return view('dashboard.admin.pesanan.verif', [
            'orders' => $result
        ]);

    }

    public function ajaxShow(Request $request) {
        $result = DB::select("SELECT * FROM unverified_payment WHERE invoice_id = ?", [request('iid')]);

        foreach ($result as $key => $payment) {
            # code...
        }

        return view('ajax.show-unverified', [
            'payment' => $payment
        ]);
    }

    public function verifyInvoice(Request $request) {
        $rules = [
            'nominal' => 'required|integer|max:255',
            'payment_id' => 'required',
            'status' => 'required'
        ];  

        try {


            return $request;



        } catch(\Exception $e) {
            return $e.getMessage();
        }
    }
}
