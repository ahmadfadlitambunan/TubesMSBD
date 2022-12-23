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
  {{-- History Section --}}
  <section class="section">
	<div class="container">
		<div class="row align-items-center header-history py-2 mb-3">
            <div class="col-2">ID Pesanan</div>
            <div class="col-2">Nama Paket</div>
            <div class="col-2">Tanggal</div>
            <div class="col-2">Status Pembayaran</div>
            <div class="col-2">Jumlah</div>
            <div class="col-2">Metode Pembayaran</div>
		</div>

        @foreach ($histories as $history)
        <div class="row body-history py-2 mt-3">
            <div class="col-2 font-weight-bold">{{ $history->invoice_id }}</div>
            <div class="col-2 font-weight-bold">{{ $history->name_plan }}</div>
            <div class="col-2 font-weight-bold">
                {{ date_format(date_create($history->invoice_created_at), "d M Y H:i") }}
            </div>
            <div class="col-2 font-weight-bold">
                @if(is_null($history->invoice_status))
                <p class="mb-0 badge badge-warning">Belum Terverifikasi</p> 
                @else
                @switch($history->invoice_status)
                    @case(0)
                    <p class="mb-0 badge badge-danger">Invalid</p> 
                    @break
                    
                    @case(1)
                    <p class="mb-0 badge badge-danger">Sukses</p> 
                    @break

                    @case(2)
                    <p class="mb-0 badge badge-danger">Sebagian</p> 
                    @break

                    @case(3)
                    <p class="mb-0 badge badge-danger">Berlebih</p> 
                    @break
                @endswitch
                @endif
            </div>
            <div class="col-2 font-weight-bold">Rp {{ $history->price_plan }}</div>
            <div class="col-2 font-weight-bold">{{ $history->name_payment }}</div>
            <hr class="divider-menu mt-3">
            <div class="col-12 mt-3 px-5">
                <div class="alert alert-secondary" role="alert">
                    <div class="row">
                        <div class="col-3">
                            <p class="m-0 font-weight-bold">Nominal Pembayaran</p>
                            <p class="m-0">RP {{ $history->nominal }}</p>
                        </div>
                        <div class="col-3">
                            <p class="m-0 font-weight-bold">No Rekening</p>
                            <p class="m-0 text-sm">{{ $history->no_account_payment }} A.N {{ $history->a_n_payment }}</p>
                        </div>
                        <div class="col-3">
                            <p class="m-0 font-weight-bold text-sm">Selesaikan Pembayaran Sampai</p>
                            <p class="m-0">{{ date_format(date_create($history->invoice_created_at), "d M Y H:i")}}</p>
                        </div>
                        <div class="col-3 font-weight-bold">
                            <p class="m-0 text-sm">Detail Transakssi</p>
                            <a href="{{ route('order-detail', ['id' => $history->invoice_id]) }}" class="text-color text-sm">Lihat Detail Transaksi<i class="ti-arrow-right ml-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
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