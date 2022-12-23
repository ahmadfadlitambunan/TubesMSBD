<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AjaxController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\WEB\LatihanController;
use App\Http\Controllers\WEB\UserWebController;
use App\Http\Controllers\Admin\MemberController;
use App\Http\Controllers\WEB\ExerciseController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\WEB\MemberPlanController;
use App\Http\Controllers\Admin\VerifOrderController;
use App\Http\Controllers\Admin\CmsExerciseController;
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
Route::post('/ajax-filter', [AjaxController::class, 'filterAjax'])->name('ajax-filter');
Route::post('/ajax-modal', [AjaxController::class, 'ajaxModal'])->name('ajax-modal');



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
    Route::post('/make-order', [MemberPlanController::class, 'makeOrder'])->name('make-order');
    Route::get('/order-detail/{id}', [MemberPlanController::class, 'detailOrder'])->name('order-detail');
    Route::put('/kirim-bukti/{id}', [MemberPlanController::class, 'storeImagePayment'])->name('kirim-bukti');
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
    Route::get('/{workout}', [LatihanController::class, 'show'])->name('show-workout');
});

Route::group(['prefix' => 'exercise'], function() {
    Route::get('/{exercise}',  [LatihanController::class, 'showExercise'])->name('show-exercise');
    Route::get('/', [LatihanController::class, 'exercise'])->name('gerakan-Latihan');
});

Route::group(['prefix' => 'profile'], function() {
    Route::get('/', [UserWebController::class, 'index'])->name('profile');
    Route::get('/edit', [UserWebController::class, 'edit'])->name('edit-profile');
});

Route::get('history-transaksi', [UserWebController::class, 'history'])->name('history-transaksi');


Route::group(['prefix' => 'admin'], function() {
    Route::get('/', function() {
        return view('dashboard.admin.index');
    });

    //CMS
    Route::resource('exercise', CmsExerciseController::class);

    // Perlu Verifikasi
    Route::get('/perlu-verifikasi', [VerifOrderController::class, 'getUnverifiedOrder'])->name('verif-table');
    Route::get('ajax-show-unverified', [VerifOrderController::class, 'ajaxShow'])->name('unverified.show');
    Route::post('/verify-invoice', [VerifOrderController::class, 'verifyInvoice'])->name('verify-invoice');

    // Membership
    Route::get('/member/aktif', [MemberController::class, 'index'])->name('member-active');
    Route::get('/member/all', [MemberController::class, 'indexALL'])->name('member-all');
    Route::get('/member/in-aktif', [MemberController::class, 'indexInactive'])->name('member-inactive');
    Route::get('/member/create', [MemberController::class, 'create'])->name('member-create');
    Route::post('/member', [MemberController::class, 'makeMembership'])->name('make-member');
});

// ajax
Route::get('/ajax-harga', [MemberController::class, 'ajaxHarga'])->name('ajax-harga');