                <input type="number" class="form-control col-5 mx-1" value="" name="sets" placeholder="Sets">
                @if($Eexercise->type == 1)
                <input type="number" class="form-control col-5 mx-1" value="" name="reps" placeholder="Repetitions">
                @elseif ($Eexercise->type == 2)
                <input type="number" class="form-control col-5 mx-1" value="" name="times" placeholder="Times">
                @endif
                <div class="form-group px-4">
					<label for="workout" class="form-label font-weight-bold">Tambahkan Ke Program Anda</label>
					<select class="custom-select" name="workout" id="workout" required>
						<option selected="" value="">Nama Program</option>
                        @foreach ($Sworkouts as $sW)
                        <option value="{{ $sW->id }}">{{ $sW->name }}</option> 
                        @endforeach 
                    </select>
				</div>
                <div class="mt-3 text-right">
                    <button type="button" class="btn btn-small btn-solid-border btn-color text-dark mx-1" data-dismiss="modal">Batal</button>
                    <button type="button" class="save-exercise btn btn-small btn-color mx-1" data-eid="{{ $Eexercise->id }}">Tambahkan</button>
                </div>
               