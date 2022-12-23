@extends('layouts.main')

@section('container')
<section class="page-title bg-2">
<div class="container">
    <div class="row">
    <div class="col-lg-12 text-center">
        <ul class="list-inline mb-0">
            <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
            <li class="list-inline-item"><span class="text-white">|</span></li>
            <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">Pricing</a></li>
        </ul>
            <h1 class="text-lg text-white mt-2">Memebership </h1>
    </div>
    </div>
</div>
</section>
    <!-- Section pricing start -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <div class="divider mb-3"></div>
                    <h2>Detail Membership</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-6 mb-2">
                <h3>{{ $plan->name }}</h3>
                <span class="text-sm bg-dark text-light py-1 px-2 mr-2">Popular</span><span class="text-sm bg-dark text-light py-1 px-2 mr-2">Popular</span>
                <hr>
                <h4>Kenapa harus beli membership?</h4>
                <p>{{ $plan->desc }}</p>
                <h5>Hanya Rp {{ $plan->price }}</h5>
            </div>
            <div class="col-lg-6">
                <div class="card bg-gray">
                    <div class="card-body">
                        <form action="{{ route('make-order') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="jenisMembership" class="h6">Paket Membership</label>
                                <input type="text" name='plan' hidden value="{{ $plan->id }}">
                                <p class="form-control font-weight-bold">{{ $plan->name }}</p>
                                <p class="text-sm m-0 text-dark">Berakhir Tanggal : 12 Desember 3221</p>
                            </div>
                            <div class="form-group">
                                <label for="pilihanBayar" class="h6">Pilihan Pembayaran</label>
                                <select class="custom-select font-weight-bold" id="pilihanBayar" name="payment" required>
                                    <option selected value="">Pilihan Pembayaran</option>
                                    @foreach ($payments as $payment)
                                    <option value="{{ $payment->id }}">{{ $payment->name }}</option>
                                    @endforeach
                                  </select>
                            </div>
                            <hr>
                            <p class="h6 text-black font-weight-bold">Ringkasan Pembayaran :</p>
                            <div class="row text-black font-weight-bold">
                                <div class="col-6">Harga Paket</div>
                                <div class="col-6">Rp {{ $plan->price }}</div>
                            </div>
                            <div class="mt-2">
                                <button class="btn btn-small" onclick="return confirm('Silahkan cek kembali detail pesanan anda! Klik ok jika sudah!')" type="submit">Buat Transaksi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
@endsection

@section('script')
@if(session()->has('success'))
<script>Swal.fire({
    icon: 'success',
    title: '{{ session('success') }}',
    showConfirmButton: true,
})
</script>
@elseif(session()->has('error'))
<script>Swal.fire({
    icon: 'error',
    title:  '{{ session('error') }}',
    showConfirmButton: true,
    })
</script>
@endif
@endsection