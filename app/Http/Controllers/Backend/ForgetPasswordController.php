<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Images;
use App\Models\User;
use App\Models\Verification;
use Carbon\Carbon;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ForgetPasswordController extends Controller
{
    public function viewCheckCodeForm($user_email): Factory|View|RedirectResponse|Application
    {
        $email = decrypt($user_email);
        $user = User::query()->where('email', $email)->first();
        if (!$user) {
            $notification = ['message' => 'email may be deleted', 'alert-type' => 'error'];
            return redirect()->back()->with($notification);
        }
        return view('backend.sms.check_code', ['user_email' => $user->email]);
    }

    public function verifyUserForgetPasswordCode(Request $request, $user_email)
    {
        $user_email = decrypt($user_email);
        $validator = Validator::make($request->all(), [
            'code' => 'required|numeric|min:4|max:4',
        ]);
        $code = $request->get('code');
        if (!is_numeric($code) || empty($code)) {
            $notifications = ['message' => 'code is invalid', 'alert-type' => 'error'];
            return redirect()->back()->with($notifications);
        }

        $user = User::query()->where('email', $user_email)->first();
        if (!$user) {
            $notification = ['message' => 'email may be deleted', 'alert-type' => 'error'];
            return redirect()->back()->with($notification);
        }
        $verification_code = $request->get('code');
        $codeRaw = Verification::query()
            ->where('code', $verification_code)
            ->where('user_id', $user->id)
            ->latest()
            ->first();
        $now = Carbon::now();
        if (!empty($codeRaw)) {
            if (Carbon::parse($now)->lessThanOrEqualTo(Carbon::parse($codeRaw->expires_at)) && $codeRaw->is_valid == 1) {
                // Reset Password Page Is Here
                return redirect()->route('reset.password.form', [encrypt($user->email), encrypt($codeRaw->code)]);
            } else {
                $notification = ['message' => 'code is not valid any more', 'alert-type' => 'info'];
                return redirect()->back()->with($notification);
            }
        }

        $notification = ['message' => 'wrong verification code', 'alert-type' => 'info'];
        return redirect()->back()->with($notification);
    }

    public function resetUserForgottenPasswordForm($user_email, $user_verification_code)
    {
        $user_email = decrypt($user_email);
        $user_verification_code = decrypt($user_verification_code);
        $user = User::query()->where('email', $user_email)->first();
        if (!$user) {
            $notification = ['message' => 'email may be deleted', 'alert-type' => 'error'];
            return redirect()->back()->with($notification);
        }

        $codeRaw = Verification::query()
            ->where('user_id', $user->id)
            ->where('code', $user_verification_code)
            ->latest()
            ->first();

        if ($codeRaw && $codeRaw->is_valid == 1) {
            $codeRaw->is_valid = 0;
            $codeRaw->expires_at = Carbon::now()->subMinute()->toDateTimeString();
            $codeRaw->save();
            return view('backend.sms.change_password', ['user_email' => $user_email]);
        }

        $notification = ['message' => 'You have to get code first', 'alert-type' => 'info'];
        return redirect()->route('password.request')->with($notification);
    }

    public function storeUserForgottenPassword(Request $request, $user_email)
    {
        $user_email = decrypt($user_email);

        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = User::query()->where('email', $user_email)->first();
        if (!$user) {
            $notification = ['message' => 'email may be deleted', 'alert-type' => 'error'];
            return redirect()->back()->with($notification);
        }

        // Update New User Password Here···

        $user->password = bcrypt($request->get('password'));
        $user->save();
        $user_after_updating_password = User::query()->where('email', $user_email)->first();
        Auth::login($user_after_updating_password);
        return redirect()->route('dashboard');
        // EAP means early access program
    }

    public function uploadMultiImagesForm()
    {
        $images = Images::query()->get();
        return view('backend.images.index',['images' => $images]);
    }

    public function storeMultiImages(Request $request)
    {

    }

}
