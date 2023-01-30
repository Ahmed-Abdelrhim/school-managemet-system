<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Nexmo\Laravel\Facade\Nexmo;
use Twilio\Rest\Client;

class SmsController extends Controller
{
    public function viewSendSmsPage()
    {
        return view('backend.sms.index');
    }

    public function sendSms(Request $request)
    {
        // return $request;
        $validator = Validator::make($request->all(),[
            // 'phone_num' => 'required',
            // 'phone_num' => 'required|regex:/(01)[0-9]{9}/|not_regex:/[a-z]/|size:11',
            'phone_num' => 'required',
            'msg' => 'required|string|min:4',
        ]);

        if ($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        // return $request;
         $receiverNumber = '+20';
        $receiverNumber .= $request->get('phone_num');

        $message = $request->get('msg');

        $nexmo = app('Nexmo\Client');
        $nexmo->message()->send([
            'to'   => $receiverNumber,
            'from' => '+20 115 206 7271',
            'text' => $message,
        ]);


        $notification = ['success' => 'Message Sent Successfully' , 'alert-type' => 'success'];
        return redirect()->back()->with($notification);

    }
}
//        // $account_sid = getenv("TWILIO_SID");
//        $account_sid = 'ACca4d87b5d781f19f73128cee7bfae176';
//        // $auth_token = getenv("TWILIO_TOKEN");
//        $auth_token = '898d39225bca861f309a1c75ad74ca63';
//        $twilio_number = getenv("TWILIO_FROM");
//        $client = new Client($account_sid, $auth_token);
//
//        $client->messages->create($receiverNumber, [
//            'from' => '+201152067271',
//            'body' => $message]);
