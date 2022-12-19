<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="GYm,fitness,business,company,agency,multipurpose,modern,bootstrap4">
    
  <!-- theme meta -->
  <meta name="theme-name" content="gymfit" />
  
  <meta name="author" content="Themefisher.com">

  <title>GymFit| Fitness template</title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="{{ asset('plugins/bootstrap/css/bootstrap.css') }}">
  <!-- Icofont Css -->
  <link rel="stylesheet" href="{{ asset('plugins/icofont/icofont.min.css') }}">
  <!-- Themify Css -->
  <link rel="stylesheet" href="{{ asset('plugins/themify/css/themify-icons.css') }}">
  <!-- animate.css) -->
  <link rel="stylesheet" href="{{ asset('plugins/animate-css/animate.css') }}">
  <!-- Magnify Popup -->
  <link rel="stylesheet" href="{{ asset('plugins/magnific-popup/dist/magnific-popup.css') }}">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="{{ asset('plugins/slick-carousel/slick/slick.css') }}">
  <link rel="stylesheet" href="{{ asset('plugins/slick-carousel/slick/slick-theme.css') }}">
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="{{ asset('css/style.css') }}">
  {{-- select 2 --}}
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

  <!--  Essential Scripts =====================================-->

  <!-- Main jQuery -->
  <script src="{{ asset('plugins/jquery/jquery-3.6.2.js') }}"></script>
  <!-- Bootstrap 4.3.1 -->
  <script src="{{ asset('plugins/bootstrap/js/bootstrap.min.js') }}"></script>
  <!-- Slick Slider -->
  <script src="{{ asset('plugins/slick-carousel/slick/slick.min.js') }}"></script>
  <!--  Magnific Popup-->
  <script src="{{ asset('plugins/magnific-popup/dist/jquery.magnific-popup.min.js') }}"></script>
  <!-- Form Validator -->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
  <script src="{{ asset('plugins/google-map/gmap.js') }}"></script>

  <script src="{{ asset('js/script.js') }}"></script>
  {{-- Swall --}}
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Select 2 -->
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <meta name="csrf-token" content="{{ csrf_token() }}">

</head>
<body>
    <!-- navbar-->
    @include('layouts.partials.navbar')
    <div class="main-wrapper ">
        @yield('container')
        {{-- Footer --}}
        @include('layouts.partials.footer')
    </div>

@yield('script')

</body>

</html>