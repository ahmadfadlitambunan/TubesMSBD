<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;    
use Illuminate\Support\Str;    


class RegisterController extends Controller
{
    // Landing page
    public function index() {
        return view('auth.register', [
            'title' => 'Daftar Akun'
        ]);
    }

    // Store user input for register
    public function store(Request $request) {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'no_phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|unique:users',
            'email' => 'required|email:dns|unique:users',
            'gender' => 'required',
            'password' => 'required|min:5|max:255'
        ]);

        // $validatedData['password'] = bcrypt($validatedData['password']);
        $validatedData['password'] = Hash::make( $validatedData['password']);


        $test = DB::insert(
            "INSERT into `users` (`name`,`qr_code`,`username`, `no_phone`, `email`, `gender`, `password`, `level`, `image`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", 
                    [   
                        $validatedData['name'],
                        Str::random(20),
                        fake()->userName(),
                        $validatedData['no_phone'],
                        $validatedData['email'],
                        $validatedData['gender'],
                        $validatedData['password'],
                        '2',
                        'image.jpg'
                    ]);
        
        $request->session()->flash('success', 'Registration successfull! Please Login');

        return redirect('/login');
    }
}
