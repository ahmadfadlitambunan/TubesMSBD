@extends('layouts.main')

@section('container')
<section class="page-title bg-2">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="index.html" class="text-sm letter-spacing text-white text-uppercase font-weight-bold">Home</a></li>
              <li class="list-inline-item"><span class="text-white">|</span></li>
              <li class="list-inline-item"><a href="#" class="text-color text-uppercase text-sm letter-spacing">Latihan</a></li>
            </ul>
             <h1 class="text-lg text-white mt-2">Gerakan Latihan</h1>
        </div>
      </div>
    </div>
</section>

<section class="section">
	<div class="container">
        <div class="row mt-2">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <label for="test" class="col-3 col-lg-1 form-label">Search</label>
                            <div class="col-lg-3 col-8 mb-2">
                                <input type="text" class="form-control" id="test" placeholder="keyword">
                            </div>
                            <label for="muscles" class="col-3 col-lg-1 form-label">Otot</label>
                            <div class="col-lg-3 col-8 mb-2">
                                <select multiple class="custom-select multiple-otot" name="muscles[]" id="muscles">
                                    @foreach ($muscles as $muscle)
                                    <option value="{{ $muscle->id }}">{{ $muscle->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <label for="equipments" class="col-3 col-lg-1 form-label">Alat</label>
                            <div class="col-lg-3 col-8 mb-2">
                                <select multiple class="custom-select multiple-alat" name="equipments[]" id="equipments">
                                    @foreach ($equips as $equip)
                                    <option value="{{ $equip->id }}">{{ $equip->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="mr-auto">
                            <button type="button" class="btn btn-small filter-btn">Terapkan Filter</button>
                            <button type="reset" class="btn btn-small btn-solid-border btn-color text-dark">Reset</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div id="Exercise">
        @foreach ($exercises as $exercise)
            <div class="row justify-content-center mt-2">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <h5>{{ $exercise->name }}</h5>
                    <h6 class="mb-1">Fokus Otot</h6>
                    <p class="text-sm mb-1">
                        @foreach ($exercise->muscles as $muscle)
                            {{ $muscle->name }},
                        @endforeach
                    </p>
                    <h6 class="mb-1">Alat yang Digunakan</h6>
                    <p class="text-sm">
                        @foreach ($exercise->equipments as $equip)
                            {{ $equip->name }},
                        @endforeach
                    </p>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 mt-2">
                    <img src="{{ asset('/images/about/img-1.jpg') }}" class="img-fluid" alt="" srcset="" width="140px">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 mt-2">
                    @if(request('wid') && request('action')) 
                        <button class="btn btn-small btn-color add-btn" data-toggle="modal" data-target="#addExercise" data-eid="{{ $exercise->id }}" >Tambahkan</button>
                    @else 
                        <a href="{{ route('show-exercise', ['exercise' => $exercise->id]) }}" class="btn btn-small btn-solid-border btn-color text-dark">Detail</a>
                        <button class="btn btn-small btn-color add-btn" data-toggle="modal" data-target="#addExercise" data-eid="{{ $exercise->id }}">Tambahkan</button>
                    @endif
                </div>
            </div>
            <hr>
        @endforeach
        </div>
	</div>

<!-- Modal -->
<div class="modal fade" id="addWorkout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h4 class="modal-title" id="exampleModalLabel">Tambah ke Program Latihan</h4>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<form action="#">
			@csrf
			<div class="modal-body row justify-content-center" id="modal-input">
			</div>
			<div class="modal-footer">
                <a href="#" class="btn btn-small btn-color">Buat Program Latihan Baru</a>
			</div>
		</form>
	  </div>
	</div>
</div>

</section>
@endsection
@section('script')
<script>

    $(document).ready(function() {
        var ajaxUrl = '{{ route('ajax-modal') }}'


        $('.add-btn').click(function(e) {
            e.preventDefault();
            $('#addWorkout').modal('show');
            let eid = $(this).data('eid');
            
            let data = {
                @if(request('wid') && request('action'))
                action:'{{ request('action') }}',
                wid:{{ request('wid') }},
                eid:eid
                @else
                action: 'add_to_workout',
                eid:eid
                @endif
            }
            
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            
            $.post(ajaxUrl, data, function(response) {
                if(response && response != '') {
                    $("#modal-input").html(response)
                }
            });
        });
        
        $(document).on('click', ".save-exercise", function(e) {
            e.preventDefault()
            let eid = $(this).data('eid');

            @if(request('wid') && request('action'))
            let wid = {{ request('wid') }};
            @else
            let wid = $('select[name="workout"]').val();
            @endif

            let sets = $('input[name="sets"]').val();
            let reps = $('input[name="reps"]').val();
            let times = $('input[name="times"]').val();

            let data = {
                action:'save_exercise',
                wid:wid,
                eid:eid,
                sets:sets,
                reps:reps,
                times:times
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.post(ajaxUrl, data, function(response) {
                console.log(response)
            });
        });


        $(document).on('click', ".filter-btn", function(e) {
            let muscles =  $('select[name="muscles[]"]').val();
            let equipments = $('select[name="equipments[]"]').val();
            let urlFilter = '{{ route('ajax-filter') }}';

            let data = {
                muscles:muscles,
                equipments:equipments
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.post(urlFilter, data, function(response) {
                if(response && response != '') {
                    $("#Exercise").html(response)
                }
            });
        });
    });
    
    
    $(document).ready(() => {
        $('.multiple-otot').select2({
            placeholder: "Fokus Otot",
            allowClear: true
        });
    });

    $(document).ready(function() {
        $('.multiple-alat').select2({
            placeholder: "Alat yang Digunakan",
            allowClear: true
        });
    });


</script>
@endsection