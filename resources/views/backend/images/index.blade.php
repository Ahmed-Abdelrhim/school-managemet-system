@extends('admin.admin_master')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Content Header (Page header) -->


            <section class="content">

                <!-- Basic Forms -->
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">Upload Multi Images </h4>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col">

                                <form method="post" action="{{ route('upload.multi.images') }}"
                                      enctype="multipart/form-data" id="uploadMultiImages">
                                    @csrf
                                    <div id="errors"></div>
                                    <div class="row">

                                        <div class="col-12">

                                            <div class="row"> <!-- Upload Row -->


                                                <div class="col-md-4"><!-- Col md 4 -->
                                                    <div class="form-group">
                                                        <h5>Images <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="file" name="images[]" class="form-control"
                                                                   id="image" multiple></div>
                                                    </div>

                                                </div> <!-- End Col md 4 -->
                                            </div> <!-- End Upload Row -->


                                            <div class="row show-images"><!-- Row -->
                                                @if(isset($images) && count($images) > 0)
                                                    @foreach($images as $image)
                                                        <div class="col-md-{{  ceil(12/ count($images)) }}">
                                                            <!-- Col md 4 -->
                                                            <div class="form-group">
                                                                <div class="controls">
                                                                    <img id="showImage"
                                                                         src="{{ asset('upload/images/'.$image->src ) }}"
                                                                         style="width: 100px; width: 100px; border: 1px solid #000000;"
                                                                         alt="">
                                                                </div>
                                                            </div>
                                                        </div> <!-- End Col md 4 -->
                                                    @endforeach
                                                @else

                                                    <div class="col-md-3"><!-- Col md 4 -->
                                                        <div class="form-group">
                                                            <div class="controls">
                                                                <img id="showImage"
                                                                     src="{{ url('upload/no_image.jpg') }}"
                                                                     style="width: 100px; border: 1px solid #000000;"
                                                                     alt="">
                                                            </div>
                                                        </div>
                                                    </div> <!-- End Col md 4 -->

                                                @endif
                                            </div><!-- End Row -->

                                            <div class="row"><!-- Row -->
                                                <div class="text-xs-right">
                                                    <input type="submit" class="btn btn-rounded btn-info mb-5"
                                                           value="Submit" id="submit-data">
                                                </div>
                                            </div><!--End Row -->
                                        </div>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $('#image').change(function (e) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#showImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>

@endsection
@section('scripts')
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"
            integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script>
        $(document).on('click', '#submit-data', function (e) {
            e.preventDefault();
            var formData = new FormData($('#uploadMultiImages')[0]);
            $.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                url: "{{route('upload.multi.images')}}",
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (data) {
                    console.log(' data => ' + data);
                    $('.show-images').html(data);
                    toastr.success("Images Uploaded Successfully");
                    if (data.status == false) {
                        toastr.error("Something went wrong");
                    }
                }

                , error: function (reject) {
                    var response = $.parseJSON(reject.responseText);
                    $('#errors').text('');
                    $.each(response.errors, function (key, value) {
                        $('#errors').append('<p class="alert alert-danger">' + value + '</p>');
                        // $('#' + key + '_error').text(value[0]);
                    })

                },

            });
        });
    </script>
@endsection
