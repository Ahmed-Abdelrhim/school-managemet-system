<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Verification;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Twilio\Rest\Client;

class SmsController extends Controller
{
    public function viewSendSmsPage(): Factory|View|Application
    {
        return view('backend.sms.index');
    }

    public function sendSms(Request $request)
    {

        $validator = Validator::make($request->all(), [
            // 'mobile_number' => 'required|regex:/(01)[0-9]{9}/|not_regex:/[a-z]/|size:11',
            'mobile_number' => 'required',
            'msg' => 'required|string|min:4',
        ]);

        if ($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $receiverNumber = '+20 ';
        $mobile = $request->get('mobile_number');
        if (str_starts_with($mobile, '0')) {
            // $mobile = str_replace($mobile[0], '', $mobile );
            $mobile = substr($mobile, 1);
        }

        $receiverNumber .= $mobile;
        $message = $request->get('msg');

        try {
            $account_sid = getenv("TWILIO_SID");
            $auth_token = getenv("TWILIO_TOKEN");
            // $twilio_number = getenv("TWILIO_FROM");
            $twilio_number = '+16067332573';

            $client = new Client('ACca4d87b5d781f19f73128cee7bfae176', 'e03c9c76a5c166552baf4224f2b90e9b');
            $client->messages->create($receiverNumber, [
                'from' => $twilio_number,
                'body' => $message,
            ]);

            $notification = array(
                'message' => 'Sms Sent Successfully',
                'alert-type' => 'success'
            );
            return redirect()->back()->with($notification);
        } catch (\Exception $e) {
            $notification = array(
                'message' => 'Something Went Wrong try again!',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
    }

    public function checkCode($user_id)
    {
        if (!$user_id || is_numeric($user_id)) {
            $notification = array(
                'message' => 'Something Went Wrong',
                'alert-type' => 'error'
            );
            return view('error.404');
        }
        $user_id = decrypt($user_id);
        return view('backend.sms.check_code', ['id' => $user_id]);
    }

    public function verifyCode(Request $request, $user_id)
    {
        if (!$user_id || is_numeric($user_id)) {
            $notification = array(
                'message' => 'Something Went Wrong',
                'alert-type' => 'error'
            );
            return view('error.404');
        }

        $user_id = decrypt($user_id);
        $user = User::query()->find($user_id);
        if (!$user)
            return view('errors.404');

        $code = $request->get('code');
        $verification = Verification::query()
            ->where('code', $code)
            ->where('user_id', $user->id)
            ->latest()->first();
        if (!$verification) {
            $notification = array(
                'message' => 'Code does not exist',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }


        $now = Carbon::now();

        if ($now->lessThanOrEqualTo($verification->expires_at)) {
            return redirect()->route('change.password.form', encrypt($verification->user_id));
        }


        // return Carbon::parse($now)->format('H:i:s');

        $notification = array(
            'message' => 'Code is not valid right now',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
    }

    public function changePassword($user_id)
    {
        //        if (is_numeric($user_id))
        //            return 'true';
        //        return 'false';
        if (!$user_id || is_numeric($user_id)) {
            $notification = array(
                'message' => 'Something Went Wrong',
                'alert-type' => 'error'
            );
            return view('error.404');
        }

        $id = decrypt($user_id);
        return view('backend.sms.change_password', ['id' => $id]);
    }

    public function changePasswordFromCode(Request $request, $user_id)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
        $user_id = decrypt($user_id);
        $user = User::query()->find($user_id);
        if (!$user)
            return view('errors.404');


        $user->password = Hash::make($request->get('password'));
        $user->save();
        $user_after_updating_password = User::query()->find($user_id);
        Auth::login($user_after_updating_password);
        return redirect()->route('dashboard');
    }

    public function play($id)
    {
        $login = 'http://127.0.0.1:1010/api/login';
        $uri = 'http://127.0.0.1:1010/api/post/' . $id;


        $toke = '2|D1hmmwkKoW4nm9PtDcp6sulPN5yaQI3bSEE31Yfa';
        $response = Http::withDigestAuth('abdelrhim.admin@gmail.com', '12345678')
            ->post($login)->json();

        $string = false;
        $blogPost = Http::withToken($toke)->get($uri);


        if ($blogPost->json()['status'] == 400)
            return 'BlogPost Not Found';

        return $blogPost->json();
    }

}
// eyJpdiI6IlFmQlZiWENuR1dVT2VRMmxFK0cxTlE9PSIsInZhbHVlIjoiUXlIcnhZV25GRUlaa2FOUWtlNmlxQT09IiwibWFjIjoiYTlkYTA1MWZhOWIzMTYwMjU4NTFkYzY0NzRmZGQ1Y2U1NWQyM2JhZDY3ODI0MGE0ZjliNzE1NzBiMWUzYTQ2YSIsInRhZyI6IiJ9
