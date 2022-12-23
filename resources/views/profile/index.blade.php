@extends('layouts.main')

@section('container')
<section class="page-title bg-2">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
              <li class="list-inline-item"><span class="text-white">|</span></li>
              <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">Profile</a></li>
            </ul>
             <h1 class="text-lg text-white mt-2">{{ Auth::user()->name }}</h1>
        </div>
      </div>
    </div>
</section>
  {{-- Profile Section --}}
<section class="section">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="card border-0 rounded bg-profile">
                    <div class="card-body p-4">
                        <div class="text-center font-weight-bold">
                        <img class="img-fluid rounded-circle img-thumbnail mt-3 mb-1" src="images/about/img-1.jpg" alt="" width="180px">
                            <h5 class="text-light mt-2">
                                {{ Auth::user()->name }}
                                <br>
                                <span class="text-sm text-light py-1 px-2 rounded">
                                    @if (Auth::user()->level == '1')
                                        Olympian
                                    @else
                                        Admin
                                    @endif
                                </span>
                            </h5>
                            <div class="divider-profile"></div>
                        </div>
                        <div class="font-weight-bold mx-2 text-sm text-light">
                            <div class="mt-2 mb-3">
                                Email<br>
                                {{ Auth::user()->email }}
                            </div>
                            <div class="mb-3">
                                No HP<br>
                                {{ Auth::user()->no_phone }}
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body rounded border-0 p-2">
                                <p class="text-sm">{!! QrCode::size(100)->generate(Auth::user()->qr_code); !!}</p>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			
			<div class="col-lg-7">
				<div class="pl-3 mt-5 mt-lg-0">
                    <p class="h4 font-weight-bold"><i class="icofont-muscle text-md text-color mr-2"></i>Membership</p>
                    <div class="alert alert-warning text-sm" role="alert">
                        <h6 class="font-weight-bold mb-1 alert-heading">Beli Membership</h6>
                        <p>Dengan membeli paket membership di Olympus Gym ada dapat berlatih dengan alat - alat yang lengkap dan modern yang siap menemani latihan anda tanpa batas.</p>
                    </div>
                    <div class="alert alert-success" role="alert">
                        <div class="d-inline">
                            <h6 class="font-weight-bold mb-3 alert-heading">
                                Membership Aktif
                            </h6>
                        </div>
                        <p class="font-weight-bold hm mb-0">Membership 3 bulan</p>
                        <span class="text-sm">Berlaku hingga : <span class="font-weight-bold"> 12 Januari 2003</span></span>
                    </div>
                    <div class="alert alert-secondary" role="alert">
                        <a href="/history-transaksi" class="text-muted">History Pembelian<i class="icofont-curved-right"></i></a>
                    </div>
				</div>
				<div class="pl-3 mt-5 mt-lg-0">
                    <p class="h4 font-weight-bold"><i class="icofont-gym-alt-2 text-md text-color mr-2"></i>Latihan</p>
                    <div class="alert alert-secondary" role="alert">
                        <a href="/history-transaksi" class="text-muted">Latih Otot-otot Anda!<i class="icofont-curved-right"></i></a>
                    </div>
				</div>
                <hr>
				<div class="pl-3 mt-5 mt-lg-0">
                    <p class="h4 font-weight-bold"><i class="icofont-gear-alt text-md text-color mr-2"></i>Pengaturan Akun</p>
                    <div class="alert alert-secondary" role="alert">
                        <a href="/history-transaksi" class="text-muted">Latih Otot-otot Anda!<i class="icofont-curved-right"></i></a>
                    </div>
				</div>
			</div>
		</div>
	</div>
</section>
 {{-- Profile Section --}}
@endsection