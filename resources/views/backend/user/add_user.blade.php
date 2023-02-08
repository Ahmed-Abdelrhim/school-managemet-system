@extends('admin.admin_master')
@section('admin')

    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->


            <section class="content">

                <!-- Basic Forms -->
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">Add User</h4>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col">

{{--                                <form method="post" action="{{ route('users.store') }}" id="addUserForm">--}}
                                <form method="POST" action="" id="addUserForm">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">


                                            <div class="row">
                                                <div class="col-md-6">

                                                    <div class="form-group">
                                                        <h5>User Role <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="role" id="role" required=""
                                                                    class="form-control">
                                                                <option value="" selected="" disabled="">Select Role
                                                                </option>
                                                                <option value="Admin">Admin</option>
                                                                <option value="Operator">Operator</option>

                                                            </select>
                                                            <small id="role_error" class="form-text text-danger"></small>

                                                        </div>
                                                    </div>
                                                </div> <!-- End Col Md-6 -->

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <h5>User Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="name" id="name" class="form-control"
                                                                   required=""></div>
                                                        <small id="name_error" class="form-text text-danger"></small>

                                                    </div>

                                                </div><!-- End Col Md-6 -->


                                            </div> <!-- End Row -->


                                            <div class="row">
                                                <div class="col-md-6">

                                                    <div class="form-group">
                                                        <h5>User Email <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="email" id="email" name="email" class="form-control"
                                                                   required=""></div>
                                                        <small id="email_error" class="form-text text-danger"></small>


                                                    </div>

                                                </div> <!-- End Col Md-6 -->

                                                <div class="col-md-6">

                                                </div><!-- End Col Md-6 -->


                                            </div> <!-- End Row -->


                                            <div class="text-xs-right">
                                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                                       value="Submit" id="submit-data">

                                            </div>
                                </form>

                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

            </section>


        </div>
    </div>

@endsection
@section('scripts')
    <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script>
        $(document).on('click', '#submit-data', function (e) {
            e.preventDefault();
            $('#email_error').text('');
            // $('#name_ar_error').text('');
            $('#name_error').text('');
            $('#role_error').text('');
            // $('#details_ar_error').text('');
            // $('#details_en_error').text('');
            var formData = new FormData($('#addUserForm')[0]);
            //
            $.ajax({
                type: 'POST',
                // enctype: 'multipart/form-data',
                url: "{{route('users.store')}}",
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (data) {
                    console.log( ' Status => ' + data.status);
                    if (data.status == true) {
                        // $('#success_msg').show();
                        toastr.success("User Created Successfully");
                        $('#role').val('');
                        $('#name').val('');
                        $('#email').val('');

                    }
                }
                // , error: function (reject) {
                //     var response = $.parseJSON(reject.responseText);
                //     $.each(response.errors, function (key, val) {
                //         $("#" + key + "_error").text(val[0]);
                //     });
                // }
                , error : function (reject) {
                    var response = $.parseJSON(reject.responseText);
                    $.each(response.errors , function(key , value) {
                        $('#'+key+'_error').text(value[0]);
                    })

                    // var response = $.parseJSON(reject.responseText);
                    // $.each(response.errors , function(key , value) {
                    //     $('#'+key+'_error').text(value);
                    // });
                    // console.log(response);
                    // console.log(reject)
                },

            });
        });
    </script>
@endsection
