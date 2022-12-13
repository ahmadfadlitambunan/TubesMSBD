<!-- Header Start -->
<nav class="navbar navbar-expand-lg navigation fixed-top" id="navbar">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.html">
			<h2 class="text-white text-capitalize"></i>Gym<span class="text-color">Fit</span></h2>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsid"
			aria-controls="navbarsid" aria-expanded="false" aria-label="Toggle navigation">
			<span class="ti-view-list"></span>
		</button>
		<div class="collapse text-center navbar-collapse" id="navbarsid">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Pages.</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="about.html">About</a></li>
						<li><a class="dropdown-item" href="trainer.html">Trainer</a></li>
						<li><a class="dropdown-item" href="course.html">Courses</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="service.html">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="pricing.html">Memebership</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Blog.</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="blog.html">Blog Grid</a></li>
						<li><a class="dropdown-item" href="blog-sidebar.html">Blog Sidebar</a></li>
						<li><a class="dropdown-item" href="blog-single.html">Blog Details</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
			</ul>
			<div class="my-md-0 ml-lg-4 mt-4 mt-lg-0 ml-auto text-lg-right mb-3 mb-lg-0 dropdown">
				@if (Auth::user())	
				<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
					<img class="img-fluid rounded-circle  my-1 img-profile" src="images/about/img-1.jpg" alt="" width="50px"></a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="{{ route('profile') }}">Akun</a></li>
					<li><a class="dropdown-item" href="trainer.html">Latihan</a></li>
					<div class="divider-menu"></div>
					<li><a class="dropdown-item" href="{{ route('logout') }}">Keluar</a></li>
				</ul>
				@else					
				<a href="{{ route('login') }}" target="_blank" class="btn btn-small mx-2" >Masuk<i class="ti-angle-right ml-3"></i></a>
				<a href="{{ route('register') }}" target="_blank" class="btn btn-small btn-solid-border" >Daftar<i class="ti-angle-right ml-3"></i></a>
				@endif
			</div>
		</div>
	</div>
</nav>
<!-- Header Close -->