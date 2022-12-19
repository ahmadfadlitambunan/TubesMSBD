<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AjaxController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\WEB\LatihanController;
use App\Http\Controllers\WEB\ExerciseController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\WEB\MemberPlanController;
use App\Http\Controllers\Admin\VerifOrderController;
use App\Http\Controllers\WEB\GerakanLatihanController;

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

//ajax
Route::post('/ajax-modal', [AjaxController::class, 'ajaxModal'])->name('ajax-modal');
Route::post('/ajax-filter', [AjaxController::class, 'filterAjax'])->name('ajax-filter');


// Register
Route::get('/register', [RegisterController::class, 'index'])->name('register')->middleware('guest');
Route::post('register-store', [RegisterController::class, 'store'])->name('register-store')->middleware('guest');

// Login
Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('authenticate', [LoginController::class, 'authenticate'])->name('login-process')->middleware('guest');

//Logout
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

// Perlu Verifikasi
Route::get('/admin/perlu-verifikasi', [VerifOrderController::class, 'getUnverifiedOrder'])->name('verif-table');

// membership
Route::group(['prefix' => 'membership'], function() {
    Route::get('/', [MemberPlanController::class, 'index'])->name('membership-plan');
    Route::get('/details/{id}', [MemberPlanController::class, 'detailMembership'])->name('membership-detail');
    Route::post('/make-order', [MemberPlanController::class, 'makeOrder'])->name('make-order');
    Route::get('/order-detail/{id}', [MemberPlanController::class, 'detailOrder'])->name('order-detail');
    Route::put('/kirim-bukti/{order}', [MemberPlanController::class, 'storeImagePayment'])->name('kirim-bukti');
});


Route::post('/membership/buat-transaksi', function(){
    return view('membership.detail-membership');
});

Route::get('/membership/bukti-pembayaran', function(){
    return view('membership.upload-bukti');
});

Route::group(['prefix' => 'latihan'], function() {
    Route::get('/', [LatihanController::class, 'index'] )->name('latihan');
    Route::post('/create', [LatihanController::class, 'saveWorkout'])->name('save-workout');
    Route::get('/gerakan-latihan', [ExerciseController::class, 'index'])->name('gerakan-latihan');
});

Route::get('/profile', function(){
    return view('profile.index');
})->name('profile')->middleware('auth');



Route::get('/latihan/detail', function() {
    return view('latihan.latihan');
})->name('latihan-detail');


Route::get('/profile/edit/', function() {
    return view('profile.edit-profile');
});


Route::group(['prefix' => 'admin'], function() {
    Route::get('/', function() {
        return view('dashboard.admin.index');
    });

    //CMS
    // Route::group(['prefix' => 'cms'],)
});










// Route::get('/login', function() {
//     return view('auth.login');
// });

// Route::get('/register', function() {
//     return view('auth.register');
// });
