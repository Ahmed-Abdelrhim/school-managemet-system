<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Vonage\Laravel\Facade\Vonage;
use Twilio\Rest\Client;

class SmsController extends Controller
{
    public function viewSendSmsPage(): Factory|View|Application
    {
        return view('backend.sms.index');
    }

    public function sendSms(Request $request): RedirectResponse
    {

        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required|regex:/(01)[0-9]{9}/|not_regex:/[a-z]/|size:11',
            // 'mobile_number' => 'required',
            'msg' => 'required|string|min:4',
        ]);

        if ($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $receiverNumber = '+20 ';
        $mobile = $request->get('mobile_number');
        if (str_starts_with($mobile, '0'))
            $mobile = str_replace('0', '', $mobile);

        $receiverNumber .= $mobile;
        $message = $request->get('msg');

        try {
            $account_sid = getenv("TWILIO_SID");
            $auth_token = getenv("TWILIO_TOKEN");
            $twilio_number = getenv("TWILIO_FROM");

            $client = new Client($account_sid, $auth_token);
            $client->messages->create($receiverNumber, [
                'from' => $twilio_number,
                'body' => $message
            ]);

            $notification = array(
                'message' => 'Sms Sent Successfully',
                'alert-type' => 'success'
            );
            return redirect()->back()->with($notification);
        } catch (\Exception $e) {
            $notification = array(
                'message' => 'Sms Sent Successfully',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
    }
}


