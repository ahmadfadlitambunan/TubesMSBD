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
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<div class="divider mb-3"></div>
					<h2>Our Services</h2>
					<p class="mt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. In error reprehenderit quam enim obcaecati, repudiandae officia a cumque nemo provident!</p>
				</div>
			</div>
		</div>

		<div class="row training">
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="card align-items-center mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<h4>Hama Workout</h4>
								<p>6 jenis latihan</p>
							</div>
							<div class="col-3 px-2">
								<img src="{{ asset('images/about/img-1.jpg') }}" class="img-fluid rounded-circle img-profile" alt="" srcset="" >
							</div>
						</div>
						<hr>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3">
								<h4>3x5</h4>
							</div>
						</div>
						<a href="#" class="h6 text-right text-color">Selngkapnya</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="card align-items-center mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<h4>Hama Workout</h4>
								<p>6 jenis latihan</p>
							</div>
							<div class="col-3 px-2">
								<img src="{{ asset('images/about/img-1.jpg') }}" class="img-fluid rounded-circle img-profile" alt="" srcset="" >
							</div>
						</div>
						<hr>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<a href="#" class="h6 text-right text-color">Selngkapnya</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="card align-items-center mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<h4>Hama Workout</h4>
								<p>6 jenis latihan</p>
							</div>
							<div class="col-3 px-2">
								<img src="{{ asset('images/about/img-1.jpg') }}" class="img-fluid rounded-circle img-profile" alt="" srcset="" >
							</div>
						</div>
						<hr>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<div class="row my-1">
							<div class="col-9">
								<p>Jenis Latihan</p>
							</div>
							<div class="col-3 text-center">
								<h4>3x5</h4>
							</div>
						</div>
						<a href="#" class="h6 text-right text-color">Selngkapnya</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
@endsection