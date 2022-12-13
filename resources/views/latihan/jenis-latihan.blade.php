@extends('layouts.main')


@section('container')
<section class="page-title bg-2">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
              <li class="list-inline-item"><span class="text-white">|</span></li>
              <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">our blog</a></li>
            </ul>
             <h1 class="text-lg text-white mt-2">blog article</h1>
        </div>
      </div>
    </div>
</section>

<section class="section">
	<div class="container">
        @for ($i = 1; $i < 11; $i++)           
        <div class="row justify-content-center mt-2">
			<div class="col-lg-8">
				<div class="accordion" id="accordionExample">
                {{-- Accordion 1 --}}
                    <div class="card">
                      <div class="card-header" id="heading{{ $i }}">
                        <div class="row">
                            <div class="col-lg-2 col-sm-6">
                                <a href="#" data-toggle="collapse" data-target="#collapse{{ $i }}" aria-expanded="true" aria-controls="collapse{{ $i }}">
                                  <img src="{{ asset('images/about/img-1.jpg') }}" alt="" class="img-fluid rounded-circle" width="80px">
                                </a>
                            </div>
                            <div class="col-lg-9 col-sm-6">
                                <h5>Nama Latihan</h5>
                                <p>2 Sets x 15 reps</p>
                            </div>
                        </div>
                      </div>
                  
                      <div id="collapse{{ $i }}" class="collapse" aria-labelledby="heading{{ $i }}" data-parent="#accordionExample">
                        <div class="card-body">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#instruc{{ $i }}" role="tab" aria-controls="home" aria-selected="true">Instruksi</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#rekor{{ $i }}" role="tab" aria-controls="profile" aria-selected="false">Rekor</a>
                                </li>
                            </ul>
                            <div class="row training">
                                <div class="col-md-12">
                                    <div class="tab-content profile-tab" id="myTabContent">
                                        <div class="tab-pane fade active show" id="instruc{{ $i }}" role="tabpanel" aria-labelledby="home-tab">
                                            <div class="row mt-2">
                                                <div class="col-lg-4 col-sm-12">
                                                    <img src="https://fitnessprogramer.com/wp-content/uploads/2022/02/Barbell-Snatch.gif" alt="" srcset="" class="img-fluid">
                                                </div>
                                                <div class="col-lg-8 col-sm-12">
                                                    <div class="col-12">
                                                        <h6>Nama Latihan</h6>
                                                        <div class="row align-items-center">
                                                            <div class="col-lg-4 col-sm-12">
                                                                <h6>Fokus Area</h6>
                                                            </div>
                                                            <div class="col-lg-8 col-sm-12">
                                                                <p class="text-sm">Bahu, Dada, Paha</p>
                                                            </div>
                                                        </div>
                                                        <div class="row align-items-center">
                                                            <div class="col-lg-4 col-sm-12">
                                                                <h6>Peralatan</h6>
                                                            </div>
                                                            <div class="col-lg-8 col-sm-12">
                                                                <p class="text-sm">Bench Press, Barbell, Dumbell</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="col-12">
                                                        <h5>Persiapan</h5>
                                                        <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil temporibus commodi, facere saepe illo corrupti ea quos reiciendis rem labore porro rerum nesciunt incidunt aspernatur tenetur, deleniti minima. Obcaecati, officiis?</p>
                                                        <h5>Eksekusi</h5>
                                                        <ul class="mx-0">
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                        </ul>
                                                        <h5>Tips</h5>
                                                        <ul class="mx-0">
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                            <li>Lorem ipsum dolor sit amet.</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="rekor{{ $i }}" role="tabpanel" aria-labelledby="profile-tab">
                                            <h1>Profile</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
			</div>
		</div>
        @endfor
	</div>
</section>
@endsection