<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

/*
|--------------------------------------------------------------------------
| Console Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of your Closure based console
| commands. Each Closure is bound to a command instance allowing a
| simple approach to interacting with each command's IO methods.
|
*/

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');




//    public function sendSms(Request $request)
//    {
//        // return $request;
//        $validator = Validator::make($request->all(), [
//            'mobile_number' => 'required|regex:/(01)[0-9]{9}/|not_regex:/[a-z]/|size:11',
//            // 'mobile_number' => 'required',
//            'msg' => 'required|string|min:4',
//        ]);
//
//        if ($validator->fails())
//            return redirect()->back()->withErrors($validator)->withInput();
//
//        // return $request;
//        $receiverNumber = '+20';
//        $mobile = $request->get('mobile_number');
//        if (str_starts_with($mobile, '0'))
//            $mobile = str_replace('0', '', $mobile);
//
//        $receiverNumber .= $mobile;
//        $message = $request->get('msg');
//
//        $basic = new \Vonage\Client\Credentials\Basic("26df5740", "9C2AE7FXrQTfpvK8",
//            [
//                'base_api_url' => 'https://example.com'
//            ]
//        );
//
//        $client = new \Vonage\Client($basic);
//
//        $response = $client->sms()->send(
//            new \Vonage\SMS\Message\SMS($receiverNumber, '+201152067271', $message)
//        );
//        $message = $response->current();
//
//
////        if ($message->getStatus() == 0) {
////            // echo "The message was sent successfully\n";
////            $notification = array(
////                'message' => 'Sms Sent Successfully',
////                'alert-type' => 'success'
////            );
////            return redirect()->back()->with($notification);
////        } else {
////            // echo "The message failed with status: " . $message->getStatus() . "\n";
////            $notification = array(
////                'message' =>  $message->getStatus(),
////                'alert-type' => 'success'
////            );
////            return redirect()->back()->with($notification);
////    }
//
//
//        //        $nexmo = app('Nexmo\Client');
//        //        $nexmo->message()->send([
//        //            'to' => $receiverNumber,
//        //            'from' => '+20 115 206 7271',
//        //            'text' => $message,
//        //        ]);
//
//
//        //        $notification = array(
//        //            'message' => 'Sms Sent Successfully',
//        //            'alert-type' => 'success'
//        //        );
//        //        return redirect()->back()->with($notification);
//
//    }



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
