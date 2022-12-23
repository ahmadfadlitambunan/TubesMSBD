@extends('dashboard.layouts.main')

@section('container')
<div class="row">
    <div class="col-xl-8 col-md-5 mx-4 ">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Menambahkan Exercise</h6>
            </div>
            <div class="card-body">
                <form method="POST" action="{{ route('exercise.store') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="name">Nama Gerakan</label>
                            <input type="text" placeholder="Nama Gerakan Latihan" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" >
                            @error('name')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                        <div class="col-6">
                            <div id="#preview">
                                <label for="image">Gambar</label>
                                <img class="img-preview img-fluid mb-3 col-sm-4">
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input @error('image') is-invalid @enderror" id="image" onchange="previewImage()" name='image' value="{{ old('image') }}">
                                <label class="custom-file-label" for="image">Pilih Gambar</label>
                                @error('image')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group mt-3 col-6">
                            <label for="muscles">Fokus Otot</label>
                            <select multiple class="form-control js-example-basic-multiple" name="muscles[]" id="muscles">
                                @foreach ($muscles as $muscle)
                                    <option value="{{ $muscle->id }}">{{ $muscle->name }}</option>
                                @endforeach
                            </select>
                            @error('muscles')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="form-group mt-3 col-6">
                            <label for="equipments">Alat Latihan</label>
                            <select multiple class="form-control js-example-basic-multiple @error('equipments') is-invalid @enderror" name="equipments[]" id="equipments">
                                @foreach ($equipments as $equipment)
                                    <option value="{{ $equipment->id }}">{{ $equipment->name }}</option>
                                @endforeach
                            </select>
                            @error('equipments')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="body">Deskripsi</label>
                        @error('desc')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                        <input id="desc" type="hidden" name="desc" value="{{ old('desc')  }}">
                        <trix-editor input="desc"></trix-editor>
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Tambahkan</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
<script>
    document.addEventListener('trix-file-accept', function(e) {
        e.preventDefault();
    })

    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });

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