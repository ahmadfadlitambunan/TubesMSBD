

  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="showRecordLabel">No Order : {{ $payment->invoice_id }}</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
        <form action="{{ route('verify-invoice') }}" method="POST">
            @csrf
            <div class="m-3 ">
                <p class="h6 text-dark fw-bold">Yang Harus Bayarkan : {{ $payment->invoice_nominal }}</p>
                <p class="h6 text-dark fw-bold">Metode Pembayaran   : {{ $payment->payment_name }}</p>
                <a href="{{ asset('images/about/img-1.jpg') }}">
                  <img src="{{ asset("storage/". $payment->payment_image) }}" alt="" srcset="" class="img-preview img-fluid mb-3">
                </a>
                <div class="form-group">
                  <label for="">Nominal Yang Dibayarkan</label>
                  <input type="number" class="form-control" name="nominal" required>
                </div>
                <input type="hidden" value="{{ $payment->payment_id }}" name="payment_id">
            </div>
            <button class="btn btn-success" type="submit" value="1" name="status">Terima</button>
            <button class="btn btn-danger" type="submit" value="0" name="status">Tolak</button>
        </form>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div>
  </div>