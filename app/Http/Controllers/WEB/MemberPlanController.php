<?php

namespace App\Http\Controllers\WEB;

use Auth;
use Carbon\Carbon;
use \App\Models\Plan;
use \App\Models\Order;
use App\Models\Invoice;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

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
        // return $amount = Plan::find(request('id'));
        DB::beginTransaction();
        
        try {
            
            $harga = Plan::select('price')->find(request('plan'));

            $result = Invoice::create([
                'user_id' => Auth::user()->id,
                'plan_id' => request('plan'),
                'pending_amount' => $harga->price,
                'method_payment_id' => request('payment'),
                'expired_at' => Carbon::now()->addDays(3),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
            DB::commit();

            return redirect()->route('order-detail', ['id' => $result->id])->with('success', "Pesanan Berhasil Dibuat, Silahkan upload bukti pembayaran");
            
        } catch(\Exception $e) {
            DB::rollback();
            return $e->getMessage();
            return back()->with('error', "Pesanan gagal dibuat, silahkan coba lagi");

        }
    }


    public function detailOrder($id){

        $result = DB::select("CALL detail_invoice(?)", [$id]);

        foreach ($result as $key => $order) {
        }

        return view('membership.upload-bukti', [
            'order' => $order,
            'payments' => Payment::where('invoice_id', '=', $id)->get()
        ]);
    }

    public function storeImagePayment(Request $request, $invoice_id) {

        $validated = $request->validate([
            'image' => 'required|image|max:1024',
        ]);

        if($request->file('image')) {
            $validated['image'] = $request->file('image')->store('payment_images');
        }
        
        try {
            $result = Payment::create([
                'image' => $validated['image'],
                'invoice_id' => $invoice_id
            ]);

            return redirect()->route('history-transaksi')->with('success', "Bukti Pembayaran berhasil di-upload.Pembayaran segera di-verifikasi");

        } catch(\Exception $e) {
            return back()->with('error', "Bukti Pembayaran gagal di-upload. Silahkan coba lagi");
        }
        
    }
}
