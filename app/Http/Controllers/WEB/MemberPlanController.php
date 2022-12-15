<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use \App\Models\Plan;
use \App\Models\Order;
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

    public function makeOrder(Request $request){
        // $store = DB::table(`order`)->raw("INSERT INTO orders (`user_id`, `plan_id`, `id_method_payment`, `expired_at`)
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
        

        $result = Order::on('mysql')->create([
            'user_id' => Auth::user()->id,
            'plan_id' =>  request('plan'),
            'method_payment_id' => request('payment'),
            'expired_at' => date('Y-m-d H:i:s', strtotime(now() . " + 1 day"))
            ]);


        if($result) {
            $msg ="<script>Swal.fire({
                icon: 'success',
                title: 'Pesanan Berhasil Dibuat',
                text: 'Silahkan upload bukti pembayaran untuk validasi pesanan!',
                showConfirmButton: true,
              })</script>";

            return redirect(route('order-detail', ['id' => $result->id] ))->withSuccess($msg);
        }

        return back()->with('failed',
        "<script>Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            showConfirmButton: true,
          })<script>");
    }

    public function detailOrder($id){

        $result = DB::select("SELECT i.id, 
                i.created_at, 
                i.expired_at, 
                i.image,
                p.name as name_plan,
                p.price,
                m.name as name_payment,
                m.a_n,
                m.account_no
            FROM orders i 
            JOIN plans p ON i.plan_id = p.id
            JOIN method_payments m ON i.method_payment_id = m.id
            WHERE i.id = ".$id." LIMIT 1;");

        foreach ($result as $key => $order) {
        }

        return view('membership.upload-bukti', [
            'order' => $order
        ]);
    }

    public function storeImagePayment(Request $request, Order $order) {

        $validated = $request->validate([
            'image' => 'required|image|max:1024',
        ]);

        if($request->file('image')) {
            $validated['image'] = $request->file('image')->store('payment_images');
        }
        
        $order->update([
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
