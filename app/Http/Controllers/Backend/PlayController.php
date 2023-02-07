<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Images;
use Illuminate\Http\Request;

class PlayController extends Controller
{
    public function carouselImages()
    {
        $images = Images::query()->limit(3)->get();
        return view('backend.images.view_images',['images'=>$images]);
    }
}
