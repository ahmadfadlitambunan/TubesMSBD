@extends('dashboard.layouts.main')

@section('container')
<div class="row">
    <div class="col-xl-8 col-md-5 mx-4 ">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Menambah Area Tubuh</h6>
            </div>
            <div class="card-body">
                <form method="POST" action="{{ route('gerakan.store') }}">
                    @csrf
                    <div class="form-group">
                        <label for="name">Nama Gerakan</label>
                        <input type="text" class="form-control" id="name"
                            name="name" placeholder="Nama Equipment" value="">
                    </div>

                    <div class="form-group">
                        <label for="desc">Deskripsi</label>
                        <input type="text" class="form-control" id="desc" name="desc"
                            placeholder="Deskripsi" value="">
                    </div>

                    <div class="form-group">
                        <label for="muscles">Fokus Otot</label>
                        <select multiple class="form-control js-example-basic-multiple" name="muscles[]" id="muscles">
                            @foreach ($muscles as $muscle)
                                <option value="{{ $muscle->id }}">{{ $muscle->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="equipments">Alat Latihan</label>
                        <select multiple class="form-control js-example-basic-multiple" name="equipments[]" id="equipments">
                            @foreach ($equipments as $equipment)
                                <option value="{{ $equipment->id }}">{{ $equipment->name }}</option>
                            @endforeach
                        </select>
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
    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });
</script>
@endsection