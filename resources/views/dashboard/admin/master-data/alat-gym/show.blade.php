@extends('dashboard.layouts.main')

@section('container')
<div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="card shadow">
                <div class="card-header">
                    <h2 class="text-dark mx-4">{{ $exercise->name }}</h2>
                </div>
                <div class="card-body">
                    <div class="row m-4">
                        <div class="col-8">
                            <img class="img-fluid" src="https://fitnessprogramer.com/wp-content/uploads/2022/02/Lying-Weighted-Lateral-Neck-Flexion.gif" alt="">
                            <div class="mt-3">
                                {{ $exercise->desc }}
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <div class="card-header">
                                    Fokus Otot
                                </div>
                                <div class="card-body">
                                    @foreach ($exercise->muscles as $muscle)
                                    <span class="badge badge-primary">{{ $muscle->name }}</span>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card mt-3">
                                <div class="card-header">
                                    Alat yang digunakan
                                </div>
                                <div class="card-body">
                                    @foreach ($exercise->equipments as $equipment)
                                    <span class="badge badge-primary">{{ $equipment->name }}</span>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection