@extends('dashboard.layouts.main')

@section('container')
<div class="row">
    <div class="col-xl-8 col-md-5 mx-4 ">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Menambah Area Tubuh</h6>
            </div>
            <div class="card-body">
                <form method="POST" action="#">
                    @csrf

                    <div class="form-group">
                        <label for="name">Nama Area Otot</label>
                        <input type="text" class="form-control" id="name"
                            name="name" placeholder="Nama Equipment" value="">
                        {{-- @error('name')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                        @enderror --}}
                    </div>

                    <div class="form-group">
                        <label for="nis">ID Equipment</label>
                        <input type="number" class="form-control" id="nis" name="nis"
                            placeholder="ID Equipment" value="">
                        {{-- @error('nis')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                        @enderror --}}
                    </div>

                    <div class="form-group">
                        <label for="nis">Deskripsi</label>
                        <input type="number" class="form-control" id="nis" name="nis"
                            placeholder="Deskripsi" value="">
                        {{-- @error('nis')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                        @enderror --}}
                    </div>

                    <div class="form-group">
                        <label for="nis">Gambar</label>
                        <input type="number" class="form-control" id="nis" name="nis"
                            placeholder="Gambar nya blm pas" value="">
                        {{-- @error('nis')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                        @enderror --}}
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Tambahkan</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection