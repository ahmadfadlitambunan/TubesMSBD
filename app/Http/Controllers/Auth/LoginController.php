<?php

namespace App\Http\Controllers\Auth;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    // landing page
    public function index() {
        return view('auth.login');
    }

    // For login manage
    public function authenticate(Request $request) {
        $request->validate([
            'identity' => 'required',
            'password' => 'required'
        ]);

        // Cek inputan apakah username, email, atau no hp
        if(Auth::attempt(['username' => request('identity'), 'password' => request('password')]) ||
            Auth::attempt(['email' => request('identity'), 'password' => request('password')]) ||
            Auth::attempt(['no_phone' => request('identity'), 'password' => request('password')])) 
        {
            $request->session()->regenerate();
            return redirect('/');
        }

        return back()->with('loginError', 'Login Failed!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
    
        $request->session()->invalidate();
    
        $request->session()->regenerateToken();
    
        return redirect('/');
    }
}
