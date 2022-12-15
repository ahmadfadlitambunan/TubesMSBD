<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class VerifOrderController extends Controller
{
    // Ambil data pesanan dari Tabel `orders`
    public function getUnverifiedOrder(){
        $result = DB::select(
            "SELECT 
                o.id,
                u.name as buyer,
                p.name as plan,
                mp.name as methodPay,
                o.image,
                o.created_at
             FROM orders o
             JOIN users u ON o.user_id = u.id
             JOIN plans p ON o.plan_id = p.id
             JOIN method_payments mp ON o.method_payment_id = mp.id
             WHERE o.status IS NULL AND o.image IS NOT NULL");
       
        return view('dashboard.admin.pesanan.verif', [
            'orders' => $result
        ]);

    }
}
