{{--<div class="modal fade text-left" id="modalCreate" tabindex="-1" role="dialog" aria-hidden="true">--}}
{{--    <div class="modal-dialog modal-lg" role="document">--}}
{{--        <div class="modal-content">--}}
{{--            <div class="modal-header">--}}
{{--                <h4 class="modal-title"> {{$item->created_at}}</h4>--}}
{{--                <button class="close" data-dismiss="modal">--}}
{{--                    <span>&times;</span>--}}
{{--                </button>--}}
{{--            </div>--}}
{{--        </div>--}}

{{--        <div class="modal-body">--}}
{{--            <p>{{$item->multi_image}}</p>--}}
{{--        </div>--}}

{{--        <div class="modal-footer">--}}
{{--            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--}}
{{--            <button type="button" class="btn btn-primary">Save changes</button>--}}
{{--        </div>--}}

{{--    </div>--}}
{{--</div>--}}


<div class="modal fade text-left" id="editStudent{{$user->id}}" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"> {{$user->name}}</h4>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
        </div>

        <div class="modal-body">
            <form method="post" action="{{ route('users.update',$user->id) }}">
                @csrf
                <div class="row">
                    <div class="col-12">


                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <h5>User Role <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <select name="role" required="" class="form-control">
                                            <option value="" selected="" disabled="">Select Role
                                            </option>
                                            <option
                                                value="Admin" {{ ($user->role == "Admin" ? "selected": "") }} >
                                                Admin
                                            </option>
                                            <option
                                                value="Operator" {{ ($user->role == "Operator" ? "selected": "") }} >
                                                Operator
                                            </option>

                                        </select>
                                    </div>
                                </div>
                            </div> <!-- End Col Md-6 -->

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>User Name <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="name" class="form-control"
                                               value="{{ $user->name }}" required=""></div>

                                </div>

                            </div><!-- End Col Md-6 -->


                        </div> <!-- End Row -->


                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <h5>User Email <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="email" name="email" class="form-control"
                                               value="{{ $user->email }}" required=""></div>

                                </div>

                            </div> <!-- End Col Md-6 -->

                            <div class="col-md-6">


                            </div><!-- End Col Md-6 -->


                        </div> <!-- End Row -->


                        <div class="text-xs-right">
                            <input type="submit" class="btn btn-rounded btn-info mb-5"
                                   value="Update">
                        </div>
            </form>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>

    </div>
</div>
