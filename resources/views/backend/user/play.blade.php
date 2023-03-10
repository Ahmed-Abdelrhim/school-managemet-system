@extends('admin.admin_master')
@section('admin')

    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->


            <!-- Main content -->
            <section class="content">
                <div class="row">


                    <div class="col-12">

                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">User List</h3>
                                <a href="{{ route('users.add') }}" style="float: right;"
                                   class="btn btn-rounded btn-success mb-5"> Add User</a>

                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th width="5%">SL</th>
                                            {{--<th>Role</th>--}}
                                            <th>Name</th>
                                            <th>Count</th>
                                            {{-- <th>Title</th>--}}
                                            <th width="25%">Action</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($designations as $key => $desi )
                                            <tr>
                                                <td>{{ $key+1 }}</td>
                                                <td> {{ $desi->name }}</td>
                                                <td>{{ $desi->users->count() }}</td>
                                                {{-- <td>{{ $user->email }}</td>--}}
                                                {{-- <td>{{ $user->designation->count() }}</td>--}}
                                                <td>
                                                    <a href="{{ route('users.edit',encrypt($desi->id)) }}"
                                                       class="btn btn-info">Edit</a>
                                                    {{--   <a href="#" data-toggle="modal"--}}
                                                    {{-- data-target="#editStudent{{$user->id}}"--}}
                                                    {{-- class="btn btn-info">Edit</a>--}}

                                                    <a href="{{ route('users.delete',$desi->id) }}"
                                                       class="btn btn-danger" id="delete">Delete</a>
                                                    {{-- @include('backend.user.modal')--}}
                                                </td>

                                            </tr>
                                        @endforeach

                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->


                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->

        </div>
    </div>

@endsection
