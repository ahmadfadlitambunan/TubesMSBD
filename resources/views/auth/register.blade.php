<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login Template</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="{{ asset('css/login.css') }}">
</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-3">
            <img src="{{ asset('images/login.jpg') }}" alt="login" class="login-card-img">
          </div>
          <div class="col-md-9">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="{{ asset('images/logo.svg') }}" alt="logo" class="logo">
              </div>
              <p class="login-card-description">Daftarkan akun mu</p>
              <form action="{{ route('register-store') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="name" class="sr-only">Nama Lengkap</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Nama Lengkap">
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="noPhone" class="sr-only">No Phone</label>
                            <input type="text" name="no_phone" id="noPhone" class="form-control" placeholder="No Phone">
                          </div> 
                    </div>
                    <div class="col-6">
                          <div class="form-group">
                            
                            <label for="email" class="sr-only">Email Addres</label>
                            <input type="text" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="Alamat Email"> 
                            @error('email')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                            @enderror
                          </div>
                    </div>
                </div>
                <div class="form-group text-sm text-muted ">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gender1" value='1'>
                        <label class="form-check-label" for="gender1">
                          Laki - Laki
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gender2" value="2">
                        <label class="form-check-label" for="gender2">
                          Perempuan
                        </label>
                    </div>
                </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="***********">
                  </div>
                <input name="register" id="register" class="btn btn-block login-btn mb-4" type="submit" value="Daftar">

                </form>
                <a href="#!" class="forgot-password-link">Forgot password?</a>
                <p class="login-card-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
            </div>
          </div>
        </div>
      </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
