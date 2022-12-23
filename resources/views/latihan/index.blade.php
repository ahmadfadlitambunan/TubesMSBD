
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
			<div class="col-12 text-right mb-2">
				<button type="button" class="btn btn-small btn-color" data-toggle="modal" data-target="#CreateWorkout"><i class="ti-plus mr-3"></i>Buat Latihan</button>
			</div>
			@foreach ($workouts as $workout)
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="card align-items-center mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<h4>{{ $workout->name }}</h4>
								<p>{{ $workout->exercises->count() }} Gerakan Latihan</p>
							</div>
							<div class="col-3 px-2">
								<img src="{{ asset('images/about/img-1.jpg') }}" class="img-fluid rounded-circle img-profile" alt="" srcset="" >
							</div>
						</div>
						<hr>
						<div class="row my-1">
							@foreach ($workout->exercises->take(3) as $exercise)
							<div class="col-9">
								<p>{{ $exercise->name }}</p>
							</div>
							<div class="col-3 text-left">
								<h6>{{ $exercise->pivot->sets }} x 
									{{ $exercise->pivot->reps ? $exercise->pivot->reps : 
									date("m:s",$exercise->pivot->time_seconds) }}</h6>
							</div>
							@endforeach
						</div>
						<a href="{{ route('show-workout', ['workout' => $workout->id]) }}" class="h6 text-right text-color">Selngkapnya</a>
					</div>
				</div>
			</div>
			@endforeach
		</div>
	</div>
</section>

	
<!-- Modal -->
<div class="modal fade" id="CreateWorkout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<form action="{{ route('save-workout') }}" method="POST" enctype="multipart/form-data">
			@csrf
			<div class="modal-body">
				<div class="form-group">
					<label for="name">Nama Latihan</label>
					<input type="text" placeholder="Input Nama Latihan" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" required>
				@error('name')
            	<div class="invalid-feedback">
              		{{ $message }}
            	</div>
            	@enderror
				</div>
				<div class="form-group">
					<label for="goal" class="form-label">Goal Program</label>
					<select class="custom-select" name="goal" id="goal" required>
						<option selected value="">Goal</option>
						@foreach ($goals as $goal)
						<option value="{{ $goal->id }}">{{ $goal->name }}</option>
						@endforeach
					</select>
				</div>
				<div class="form-group">
					<div id="#preview">
						<p class="pb-0">*opsional</p>
						<img class="img-preview img-fluid mb-3">
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input @error('image') is-invalid @enderror" id="image" onchange="previewImage()" name='image'>
						<label class="custom-file-label" for="image">Gambar</label>
						@error('image')
						<div class="invalid-feedback">
							{{ $message }}
						</div>
						@enderror
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-small btn-solid-border btn-color text-dark" data-dismiss="modal">Batal</button>
				<button type="submit" class="btn btn-small btn-color">Buat</button>
			</div>
		</form>
	  </div>
	</div>
</div>
@endsection

@section('script')
<script>
	@if($errors->any())
	$(document).ready(function(){
		$('#CreateWorkout').modal('show');
	});
	@endif

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
