<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use \App\Models\Plan;
use \App\Models\Invoice;
use Auth;

class MemberPlanController extends Controller
{
    //index
    public function index() {
        return view('membership.index', [
            'plans' => DB::select('SELECT * FROM `plans`'),
        ]);
    }

    // Make invoice
    public function detailMembership($id) {
        $result = DB::select("SELECT * FROM `plans` WHERE id = ".$id." LIMIT 1");
        $getMethodPayment = DB::select("SELECT * FROM `method_payments`");
        foreach($result as $res => $value) {
        }
        
        return view('membership.detail-membership', [
            'plan' => $value,
            'payments' => $getMethodPayment
        ]);
    }

    public function makeInvoice(Request $request){
        // $store = DB::table(`invoice`)->raw("INSERT INTO invoices (`user_id`, `plan_id`, `id_method_payment`, `expired_at`)
        //             VALUES(?, ?, ?, ?)", [
        //                 Auth::user()->id,
        //                 request('plan'),
        //                 request('payment'),
        //                 date('Y-m-d', strtotime(now() . " + 1 day"))
        //             ]);

        // $id = DB::connection('mysql')->insertGetId([
        //     'user_id' => Auth::user()->id,
        //     'plan_id' =>  request('plan'),
        //     'id_method_payment' => request('payment'),
        //     'expired_at' => date('Y-m-d', strtotime(now() . " + 1 day"))
        //     ]);
        

        $result = Invoice::on('mysql')->create([
            'user_id' => Auth::user()->id,
            'plan_id' =>  request('plan'),
            'id_method_payment' => request('payment'),
            'expired_at' => date('Y-m-d H:i:s', strtotime(now() . " + 1 day"))
            ]);


        if($result) {
            $msg ="<script>Swal.fire({
                icon: 'success',
                title: 'Pesanan Berhasil Dibuat',
                text: 'Silahkan upload bukti pembayaran untuk validasi pesanan!',
                showConfirmButton: true,
              })</script>";

            return redirect(route('invoice-detail', ['id' => $result->id] ))->withSuccess($msg);
        }

        return back()->with('failed',
        "<script>Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            showConfirmButton: true,
          })<script>");
    }

    public function detailInvoice($id){

        $result = DB::select("SELECT i.id, 
                i.created_at, 
                i.expired_at, 
                i.image,
                p.name as name_plan,
                p.price,
                m.name as name_payment,
                m.a_n,
                m.account_no
            FROM invoices i 
            JOIN plans p ON i.plan_id = p.id
            JOIN method_payments m ON i.id_method_payment = m.id
            WHERE i.id = ".$id." LIMIT 1;");

        foreach ($result as $key => $invoice) {
        }

        return view('membership.upload-bukti', [
            'invoice' => $invoice
        ]);
    }

    public function storeImagePayment(Request $request, Invoice $invoice) {

        $validated = $request->validate([
            'image' => 'required|image|max:1024',
        ]);

        if($request->file('image')) {
            $validated['image'] = $request->file('image')->store('payment_images');
        }
        $invoice->update([
            'image' => $validated['image']
        ]);

         /*
            $invoice didapat dari route model binding
            SELECT * FROM invoices WHERE id = {invoice} -> id yang diberi lewat URI

            Query Update :
            UPDATE invoices SET image = $validated['image] WHERE id = {invoice} -> id yang diberi lewat URI
         */

        return redirect(route('profile'));
    }
}
