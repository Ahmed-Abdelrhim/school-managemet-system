<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Images;
use App\Models\User;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\App;

class PlayController extends Controller
{
    public function carouselImages()
    {
        $images = Images::query()->limit(3)->get();
        return view('backend.images.view_images',['images'=>$images]);
    }

    public function downloadPdfFile()
    {
        $allData = User::query()->get(['id','usertype','name','email','Code']);
        $pdf = Pdf::loadView('backend.images.pdf', ['allData' =>$allData]);
        return $pdf->download('users_file.pdf');
    }
}
