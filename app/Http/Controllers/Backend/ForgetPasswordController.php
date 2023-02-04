<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class ForgetPasswordController extends Controller
{
    public function viewCheckCodeForm(): Factory|View|Application
    {
        return view('backend.sms.check_code');
    }
}
