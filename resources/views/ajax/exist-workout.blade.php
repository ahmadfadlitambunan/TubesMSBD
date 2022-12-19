                <div class="col-12 mb-1">
                    <h4 class="text-center">Tambahkan Ke {{ $Nworkout->name }}</h4>
                </div>
                <input type="number" class="form-control col-5 mx-1" value="" name="sets" placeholder="Sets">
                @if($Eexercise->type == 1)
                <input type="number" class="form-control col-5 mx-1" value="" name="reps" placeholder="Repetitions">
                @elseif ($Eexercise->type == 2)
                <input type="number" class="form-control col-5 mx-1" value="" name="times" placeholder="Times">
                @endif
                <div class="mt-3 text-right">
                    <button type="button" class="btn btn-small btn-solid-border btn-color text-dark mx-1" data-dismiss="modal">Batal</button>
                    <button type="button" class="save-exercise btn btn-small btn-color mx-1" data-eid="{{ $Eexercise->id }}">Tambahkan</button>
                </div>
               
                