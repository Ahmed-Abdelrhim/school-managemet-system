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
                                <a href="{{ route('download.pdf') }}" style="float: right; margin-right: 10px"
                                   class="btn btn-rounded btn-success mb-5"> Download PDF</a>

                            </div>

                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="table-responsive">
                                    <!-- example1    table table-bordered table-striped   -->
                                    <table id="dataTable-example" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            {{--                                            <th width="5%">SL</th>--}}
                                            {{--                                            <th>Role</th>--}}
                                            {{--                                            <th>Name</th>--}}
                                            {{--                                            <th>Email</th>--}}
                                            {{--                                            <th>Code</th>--}}
                                            {{--                                            <th width="25%">Action</th>--}}

                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Code</th>
                                            <th width="25%">Action</th>

                                        </tr>
                                        </thead>


                                        <tbody>
                                        </tbody>
                                        {{--   <tfoot>--}}
                                        {{--  </tfoot>--}}
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
@section('scripts')
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var table = $('#dataTable-example').DataTable({
                serverSide: true,
                processing: true,
                pagingType: 'full_numbers',
                paging: true,
                pagingTypeSince: 'numbers',
                'fixedHeader': true,
                {{--ajax: {--}}
                    {{--    url: "{{Route('users.dataTables')}}"--}}
                    {{--},--}}
                ajax: "{{Route('users.dataTables')}}",
                "ordering": false,
                columns: [
                    {data: 'id', name: 'id'},
                    {data: 'name', name: 'name'},
                    {data: 'email', name: 'email'},
                    {data: 'code', name: 'code'},
                    {data: 'actions', name: 'actions'},
                ]

            });
        });
    </script>
@endsection




{{--                                        @foreach($allData as $key => $user )--}}
{{--                                            <tr>--}}
{{--                                                <td>{{ $key+1 }}</td>--}}
{{--                                                <td> {{ $user->role }}</td>--}}
{{--                                                <td>{{ $user->name }}</td>--}}
{{--                                                <td>{{ $user->email }}</td>--}}
{{--                                                <td>{{ $user->code }}</td>--}}
{{--                                                <td>--}}
{{--                                                    <a href="{{ route('users.edit',encrypt($user->id)) }}" class="btn btn-info">Edit</a>--}}
{{--                                                    --}}{{--   <a href="#" data-toggle="modal"--}}
{{--                                                    --}}{{-- data-target="#editStudent{{$user->id}}"--}}
{{--                                                    --}}{{-- class="btn btn-info">Edit</a>--}}
{{--                                                    --}}{{-- @include('backend.user.modal')--}}
{{--                                                    <a href="{{ route('users.delete',$user->id) }}" class="btn btn-danger" id="delete">Delete</a>--}}
{{--                                                </td>--}}

{{--                                            </tr>--}}
{{--                                        @endforeach--}}
