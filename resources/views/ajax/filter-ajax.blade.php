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
                    <button class="btn btn-small btn-solid-border btn-color text-dark">Detail</button>
                    <button class="btn btn-small btn-color add-btn" data-toggle="modal" data-target="#addExercise" data-eid="{{ $exercise->id }}">Tambahkan</button>
                @endif
            </div>
		</div>
        <hr>
        @endforeach