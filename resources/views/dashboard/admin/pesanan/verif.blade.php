@extends('dashboard.layouts.main')

@section('container')
<div class="row">
    <div class="col-xl-12 col-md-10 mx-1 ">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Perlu Verifikasi</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class = 'table table-bordered' id="myTable">
                        <thead>
                            <tr>
                                <th>ID Pesanan</th>
                                <th>Pemesan</th>
                                <th>Paket Membership</th>
                                <th>Jenis Pembayaran</th>
                                <th>Tanggal</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orders as $order)      
                            <tr>
                                 <td>{{ $order->invoice_id }}</td>
                                 <td>{{ $order->buyer_name }}</td>
                                 <td>{{ $order->plan_name }}</td>
                                 <td>{{ $order->methodPay_name }}</td>
                                 <td>
                                    {{ 
                                    date_format(date_create($order->invoice_created_at), "d M Y H:i") 
                                    }}
                                </td>
                                 <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary show-btn" data-toggle="modal" data-target="#showRecord" data-iid="{{ $order->invoice_id }}">
                                    <i class="fas fw fa-eye"></i>
                                </button>
                                 </td>
                             </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
  <!-- Modal -->
  <div class="modal fade" id="showRecord" tabindex="-1" role="dialog" aria-labelledby="showRecordLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" id="showImageInvoice">
    </div>
  </div>
@endsection

@section('script')
    <script>
        @if(session()->has('success'))
        Swal.fire({
            icon: 'success',
            title: '{{ session('success') }}',
            showConfirmButton: true,
        })
        
        @elseif(session()->has('error'))
        Swal.fire({
            icon: 'error',
            title:  '{{ session('error') }}',
            showConfirmButton: true,
        })
        
        @endif

        $(document).on('click', '.show-btn', function(e) {
            let iid = $(this).data('iid');
            let ajaxUrl = '{{ route('unverified.show') }}'

            let data = {
                iid:iid
            }
            $.get(ajaxUrl, data, function(response) {
                $('#showImageInvoice').html(response)
            });
        });

    </script>
@endsection