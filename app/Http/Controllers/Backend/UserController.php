<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function UserView()
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');
        $allData = User::all();
        $data['allData'] = User::query()->where('usertype', 'Admin')->get();
        return view('backend.user.view_user', $data);

    }


    public function UserAdd()
    {
        return view('backend.user.add_user');
    }


    public function UserStore(Request $request)
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $validatedData = $request->validate([
            'email' => 'required|unique:users',
            'name' => 'required',
        ]);

        $data = new User();
        $code = rand(0000, 9999);
        $data->usertype = 'Admin';
        $data->role = $request->role;
        $data->name = $request->name;
        $data->email = $request->email;
        $data->password = bcrypt($code);
        $data->code = $code;
        $data->save();

        $notification = array(
            'message' => 'User Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('user.view')->with($notification);

    }


    public function UserEdit($id)
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $editData = User::query()->find($id);
        return view('backend.user.edit_user', compact('editData'));

    }


    public function UserUpdate(Request $request, $id)
    {

        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $data = User::query()->find($id);
        $data->name = $request->name;
        $data->email = $request->email;
        $data->role = $request->role;
        $data->save();

        $notification = array(
            'message' => 'User Updated Successfully',
            'alert-type' => 'info'
        );

        return redirect()->route('user.view')->with($notification);

    }


    public function UserDelete($id)
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $user = User::query()->find($id);
        $user->delete();

        $notification = array(
            'message' => 'User Deleted Successfully',
            'alert-type' => 'info'
        );

        return redirect()->route('user.view')->with($notification);

    }


}
