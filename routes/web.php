<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\MemberPlanController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});



// Register
Route::get('/register', [RegisterController::class, 'index'])->name('register')->middleware('guest');
Route::post('register-store', [RegisterController::class, 'store'])->name('register-store')->middleware('guest');

// Login
Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('authenticate', [LoginController::class, 'authenticate'])->name('login-process')->middleware('guest');

//Logout
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

// membership
Route::group(['prefix' => 'membership'], function() {
    Route::get('/', [MemberPlanController::class, 'index'])->name('membership-plan');
    Route::get('/details/{id}', [MemberPlanController::class, 'detailMembership'])->name('membership-detail');
    Route::post('/make-invoice', [MemberPlanController::class, 'makeInvoice'])->name('make-invoice');
    Route::get('/invoice-detail/{id}', [MemberPlanController::class, 'detailInvoice'])->name('invoice-detail');
    Route::put('/kirim-bukti/{invoice}', [MemberPlanController::class, 'storeImagePayment'])->name('kirim-bukti');
});




Route::post('/membership/buat-transaksi', function(){
    return view('membership.detail-membership');
});

Route::get('/membership/bukti-pembayaran', function(){
    return view('membership.upload-bukti');
});

Route::get('/profile', function(){
    return view('profile.index');
})->name('profile')->middleware('auth');

Route::get('/latihan', function() {
    return view('latihan.index');
});

Route::get('/latihan/detail', function() {
    return view('latihan.latihan');
});

Route::get('/latihan/jenis-latihan', function() {
    return view('latihan.jenis-latihan');
});


// Route::get('/login', function() {
//     return view('auth.login');
// });

// Route::get('/register', function() {
//     return view('auth.register');
// });
