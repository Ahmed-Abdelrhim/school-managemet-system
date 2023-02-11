<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Images;
use App\Models\User;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;

class PlayController extends Controller
{
    public function carouselImages()
    {
        $images = Images::query()->limit(3)->get();
        return view('backend.images.view_images', ['images' => $images]);
    }

    public function downloadPdfFile()
    {
        $allData = User::query()->get(['id', 'usertype', 'name', 'email', 'Code']);
        // This Limits Only 10
        $pdf = Pdf::loadView('backend.images.pdf', ['allData' => $allData]);
        //        $pdf = Pdf::loadView('backend.images.pdf',['allData' =>$allData])
        //            ->setPaper('a4', 'landscape')
        //            ->setWarnings(false);
        return $pdf->download('users_new_file.pdf');
    }

    public function getUsersForApi()
    {
        $users = User::query()->paginate(10);
        return response()->json(['status' => 200, 'message' => 'OK', 'data' => $users]);
    }

    public function createUserForApi(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 400, 'message' => $validator->messages()]);
        }

        return response()->json(['status' => 200, 'message' => 'OK', 'data' => $request->get('email')]);
    }

    public function playWithApiCreateUser()
    {
        $uri = 'http://127.0.0.1:1050/api/create/users';
        $get_users = 'http://127.0.0.1:1050/api/get/users';

        //        $createUser = Http::withHeaders([
        //            'Authorization' => 'application/json',
        //            'Content-Type' => 'application/json'
        //        ])
        //            ->post($uri,
        //                [
        //                    'email' => 'api.email@example.com',
        //                    'password' => '123456',
        //                ]);

        $createUser = Http::timeout(60)->get($uri);
        return $createUser;
    }
}
