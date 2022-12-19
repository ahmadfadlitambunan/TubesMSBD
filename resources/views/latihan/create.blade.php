@extends('layouts.main')

@section('container')
<section class="page-title bg-2">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
              <li class="list-inline-item"><span class="text-white">|</span></li>
              <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">Progam Latihan</a></li>
            </ul>
             <h1 class="text-lg text-white mt-2">Buat Program Latihan Mu</h1>
        </div>
      </div>
    </div>
</section>
<section class="section">
	<div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <form action="" method="post">
                    <div class="card"> 
                        <div class="card-header">
                            <div class="form-group">
                                <label for="name" class="form-label">Nama Program</label>
                                <input type="text" class="form-control" name="name" id="name">
                            </div>
                            <div class="form-group">
                                <label for="goal" class="form-label">Goal Program</label>
                                <select class="custom-select" name="goal" id="goal" required>
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                  </select>
                            </div>
                            <div id="#preview">
                                <img class="img-preview img-fluid mb-3">
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" onchange="previewImage()" name='image'>
                                <label class="custom-file-label" for="image">Pilih Gambar **opsional</label>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-2"> 
                        <div class="card-body">
                            <div class="row justify-content-center mt-2">
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <h5>Nama Gerakan</h5>
                                    <h6 class="mb-1">Fokus Otot</h6>
                                    <p class="text-sm mb-1">Bahu, Dada, Paha</p>
                                    <h6 class="mb-1">Alat yang Digunakan</h6>
                                    <p class="text-sm">Dumbell, bench</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 mt-2">
                                    <img src="{{ asset('/images/about/img-1.jpg') }}" class="img-fluid" alt="" srcset="" width="140px">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 mt-2">
                                    <button class="btn btn-small btn-solid-border btn-color text-dark">Detail</button>
                                    <button class="btn btn-small btn-color">Simpan</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
	</div>
</section>
@endsection