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
  <section class="section pricing">
      <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-8 text-center">
                  <div class="section-title">
                      <div class="divider mb-3"></div>
                      <h2>Package Pricing</h2>
                  </div>
              </div>
          </div>
          <div class="row justify-content-center">
                @foreach ($plans as $plan)
                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                    <div class="card rounded-0 px-4 py-5 ">
                        <h4 class="card-title text-capitalize font-weight-normal font-secondary">{{ $plan->name }}</h4>
                        <h3 class="text-lg font-secondary position-relative mt-2"><sup class="text-sm position-absolute ">Rp</sup>  {{ $plan->price }}<sub>
                            @if ($plan->duration_month >= 12)
                            {{ ($plan->duration_month / 12)}} Year
                            @else
                            {{ $plan->duration_month}} Month
                            @endif
                        </sub>
                        </h3>
    
                         <div class="card-body mt-2">
                            {{ $plan->desc }}
                        </div>
                        <a href="{{ route('membership-detail', ['id' => $plan->id]) }}" class="btn btn-main text-white">Buy Now</a>
                    </div>
                </div>
                @endforeach
          </div>
      </div>
  </section>
  <!-- Section pricing End -->
@endsection