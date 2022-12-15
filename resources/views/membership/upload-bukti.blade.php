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

{{-- Detail Pesanan --}}
<section class="section pricing">
    <div class="container" id="start">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <div class="divider mb-3"></div>
                    <h2>Transaksi</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mb-2">
            <div class="col-lg-9">
                <div class="card bg-gray">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <h4>NO Order</h4>
                                <p class="font-weight-bold">{{ $order->id }}</p>
                            </div>
                            <div class="col-6">
                                <h4>Tanggal</h4>
                                <p class="font-weight-bold">{{ $order->created_at }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <h4>Paket membership</h4>
                                <p class="font-weight-bold">{{ $order->name_plan }}</p>
                            </div>
                            <div class="col-6">
                                <h4>Jumlah</h4>
                                <p class="font-weight-bold">Rp {{ $order->price }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <h4>Metode Pembayaran</h4>
                                <p class="font-weight-bold">{{ $order->name_payment }}</p>
                            </div>
                            <div class="col-6">
                                <h4>No Rekening</h4>
                                <p class="font-weight-bold">{{ $order->account_no ." a.n ". $order->a_n }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <div class="card bg-gray">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <p class="text-black font-weight-bold">Sudah melakukan pembayaran?</p>
                            </div>                           
                            <div class="col-6">
                                {{-- Trigger MOdal --}}
                                <button type="button" class="btn btn-small" data-toggle="modal" data-target="#exampleModal">
                                    Upload Bukti Pembayaran
                                </button>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{{-- Modal untuk upload bukti pembayaran --}}  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form action="{{ route('kirim-bukti', ['order' => $order->id]) }}" method="post" enctype="multipart/form-data">
                @method('put')
                @csrf
                <div id="#preview">
                    <img class="img-preview img-fluid mb-3">
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="image" onchange="previewImage()" name='image'>
                    <label class="custom-file-label" for="image">Choose file</label>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-small btn-solid-border text-black" data-dismiss="modal">Batal</button>
                  <button type="submit" class="btn btn-small" onclick="return confirm('Periksa kembali gambar! Klik ok jika sudah!')">Upload Bukti</button>
                </div>
            </form>
        </div>
      </div>
    </div>
  </div>
  @if (session('success'))
  {!!  session()->get('success')  !!}
  @endif

  <script>
    document.querySelector('.custom-file-input').addEventListener('change',function(e){
        var fileName = document.getElementById("image").files[0].name;
        var nextSibling = e.target.nextElementSibling
        nextSibling.innerText = fileName
    })

    function previewImage() {
        const image = document.querySelector('#image');
        const imgPreview = document.querySelector('.img-preview');
        imgPreview.style.display = 'block';
        const oFReader = new FileReader();
        oFReader.readAsDataURL(image.files[0]);
        oFReader.onload = function(oFREvent) {
            imgPreview.src = oFREvent.target.result;
        }
    }
    </script>
@endsection