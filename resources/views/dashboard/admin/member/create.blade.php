@extends('dashboard.layouts.main')

@section('container')
<form method="POST" action="{{ route('make-member') }}">
@csrf
<div class="row">
    <div class="col-xl-7 col-md-5 mx-4 ">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Pendaftar</h6>
            </div>
            <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="name">Nama</label>
                            <input type="text" placeholder="Nama" name="name" id="name" class="form-control" value="" required>
                        </div>
                        <div class="col-6">
                            <label for="no_phone">No HP</label>
                            <input type="text" placeholder="No HP" name="no_phone" id="no_phone" class="form-control" value="" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group mt-3 col-6">
                            <label for="email">Email *opsional</label>
                            <input type="email" placeholder="No HP" name="email" id="email" class="form-control" value="">
                        </div>
                        <div class="form-group mt-3 col-6">
                            <label for="">Jenis Kelamin</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender1" required>
                                <label class="form-check-label" for="gender1">
                                  Laki - Laki
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender2" required>
                                <label class="form-check-label" for="gender2">
                                  Perempuan
                                </label>
                              </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group mt-3 col-6">
                            <label for="address">Alamat *opsional</label>
                            <input type="address" placeholder="No HP" name="address" id="address" class="form-control" value="" required>
                        </div>
                        <div class="form-group mt-3 col-6">
                            <Label>Goal</Label>
                            <select class="custom-select" required name="goal_id">
                                <option selected>Goal</option>
                                @foreach ($goals as $goal)
                                <option value="{{ $goal->id }}">{{ $goal->name }}</option>
                                @endforeach
                            </select>
                            {{-- @error('equipments')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror --}}
                        </div>
                    </div>
                <button type="submit" class="btn btn-primary mt-3">Tambahkan</button>
            </div>
        </div>
    </div>
    <div class="col-xl-4">
       <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Paket Membership</h6>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <Label>Paket Membership</Label>
                    <select class="custom-select" name="plan_id" id="plan">
                        <option selected>-- Pilih Paket Membership --</option>
                        @foreach ($plans as $plan)
                            <option value="{{ $plan->id }}">{{ $plan->name }}</option>
                        @endforeach
                    </select>
                    {{-- @error('name')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                    @enderror --}}
                </div>
                <div class="form-group">
                    <Label>Metode Pembayaran</Label>
                    <select class="custom-select" name="method_payment_id">
                        <option selected>-- Pilih Metode Pembayaran --</option>
                        @foreach ($methodPays as $methodPay)
                            <option value="{{ $methodPay->id }}">{{ $methodPay->name }}</option>
                        @endforeach
                    </select>
                    {{-- @error('name')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                    @enderror --}}
                </div>
                <div class="mt-4">
                    <p class="text-dark font-weight-bold">Total Pembayaran : <span id="nominal"></span></p>
                </div>
            </div>
       </div>
    </div>
</div>
</form>
@endsection
@section('script')
<script>
    document.addEventListener('trix-file-accept', function(e) {
        e.preventDefault();
    })

    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });

    $(document).on('change', '#plan', function(e) {
        let ajaxUrl = '{{ asset('ajax-harga') }}' 
        e.preventDefault;
        let pid = $(this).val()
        let data = {
            pid:pid
        }


        
        $.get(ajaxUrl, data, function(response) {
            if(response && response != '') {
                $("#nominal").html(response.price)
            }
        });
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