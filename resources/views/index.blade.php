@extends('layouts.main')

@section('container')
    <!-- Section Slider Start -->
<!-- Slider Start -->
<section class="slider">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<span class="h6 d-inline-block mb-4 subhead text-uppercase">Gym fitness club</span>
				<h1 class="text-uppercase text-white mb-5">Step up your <span class="text-color">fitness Challange</span><br>with us</h1>
			
				<a href="pricing.html" target="_blank" class="btn btn-main " >Join Us <i class="ti-angle-right ml-3"></i></a>
			</div>
		</div>
	</div>
</section>
<!-- Section Slider End -->

<!-- Section Intro Start -->
<section class="mt-80px">
	<div class="container">
		<div class="row ">
			<div class="col-lg-4 col-md-6">
				<div class="card p-5 border-0 rounded-top border-bottom position-relative hover-style-1">
					<span class="number">01</span>
					<h3 class="mt-3">ALAT MODERN</h3>
					<p class="mt-3 mb-4">Oplympus Gym menyediakan banyak alat - alat modern yang siap membantu latihan anda menjadi lebih baik</p>
					<a href="about.html" class="text-color text-uppercase font-size-13 letter-spacing font-weight-bold"><i class="ti-minus mr-2 "></i>more Details</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="card p-5 border-0 rounded-top hover-style-1">
					<span class="number">02</span>
					<h3 class="mt-3">LINGKUNGAN GYM MENYENANGKAN</h3>
					<p class="mt-3 mb-4">Semua Olympian yang berlatih di sini tidak mengenal senioritas. Semua dapat berlatih dengan kreativitasnya</p>
					<a href="about.html" class="text-color text-uppercase font-size-13 letter-spacing font-weight-bold"><i class="ti-minus mr-2 "></i>more Details</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="card p-5 border-0 rounded-top hover-style-1">
					<span class="number">03</span>
					<h3 class="mt-3">HEALTHY DIET Plan</h3>
					<p class="mt-3 mb-4">Vestibulum sit amet blan augue, sit amet vehicula mi. Aliquam vitae varius.</p>
					<a href="about.html" class="text-color text-uppercase font-size-13 letter-spacing font-weight-bold"><i class="ti-minus mr-2 "></i>more Details</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Section Intro End -->

<!-- Section About start -->
<section class="section about">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6">
            <img src="{{ asset("images/bg/bg-5.jpg") }}" alt="" class="img-fluid rounded shadow w-100">
			</div>
			
			<div class="col-lg-6">
				<div class="pl-3 mt-5 mt-lg-0">
					<h2 class="mt-1 mb-3">We’ve skill in <br>wide <span class="text-color">range of fitness</span> and Other body health facility. </h2>

					<p class="mb-4">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam lorem ante, dapibus in.</p>

					<a href="#" class="btn btn-main">Learn More<i class="fa fa-angle-right ml-2"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Section About End -->


<!-- Section Services Start -->
<section class="section services ">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<div class="divider mb-3"></div>
					<h2>Our Services</h2>
					<p>We offer more than 35 group exercis, aerobic classes each week.</p>
				</div>
			</div>
		</div>

		<div class="row no-gutters">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-gym-alt-2 text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">WEIGHT LIFTING</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-cycling-alt text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">Cycling</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-gym-alt-3 text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">YOGA MEDIDATION</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-muscle text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">Building body</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-dumbbell text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">Fitness Track</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="text-center  px-4 py-5 hover-style-1">
					<i class="icofont-gym text-lg text-color"></i>
					<h4 class="mt-3 mb-4 text-uppercase">Fitness</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, molestias.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Section Services End -->

@endsection