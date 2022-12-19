@extends('dashboard.layouts.main')

@section('container')
<div class="row">
    <div class="col-xl-12 col-md-12 ">

        <div class="card shadow mb-8">
            <div class="card-header py-3 d-flex flex-row align-items-center">
                <h6 class="mr-auto font-weight-bold text-primary">Daftar Program Latihan</h6>
                <a href="#" class="btn btn-primary mx-2"><i class="fas fw fa-user-plus"></i></a>
                <div class="dropdown">
                    <button class="btn btn-outline-success" data-toggle="dropdown">Report<i class="fas fw fa-caret-down ml-2"></i></button>
                    <div class="dropdown-menu mt-2">
                        <a href="#" class="dropdown-item">Export Xlsx</a>
                        <a href="#" class="dropdown-item">Export Csv</a>
                    </div>
                </div>
                <button type="button" class="btn btn-success ml-2" data-toggle="modal" data-target="#importCsv">
                    importCsv
                </button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class='table table-bordered' id="myTable">
                        <thead style="text-align: center">
                            <tr>
                                <th>No</th>
                                <th>Area Tubuh</th>
                                <th>Deskripsi</th>
                                <th>Gambar</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody style="text-align: center">
                            <tr>
                                <td>test</td>
                                <td>lorem 1</td>
                                <td>Test</td>
                                <td><img src="{{ asset("/images/about/img-1.jpg") }}" alt="" srcset="" width="100px" height="100px"></td>
                                <td>
                                    <a href="#" class="btn btn-sm btn-success"><i
                                        class="fa fa-eye" aria-hidden="true"></i></a>
                                    <a href="#" class="btn btn-sm btn-warning"><i
                                            class="fa fa-edit" aria-hidden="true"></i></a>

                                    <form action="#" method="POST" class="d-inline">
                                        @method('delete')
                                        @csrf
                                        <button class="btn btn-sm btn-danger"
                                            onclick="return confirm('Semua data yang berelasi dengan ini akan ikut terhapus, Anda Yakin?')"><i class="fa fa-trash"
                                                aria-hidden="true"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection