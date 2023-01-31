<?php

use App\Models\Verification;
use Illuminate\Foundation\Inspiring;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Laravel\Fortify\Contracts\FailedPasswordResetLinkRequestResponse;
use Laravel\Fortify\Contracts\SuccessfulPasswordResetLinkRequestResponse;
use Laravel\Fortify\Fortify;
use Twilio\Rest\Client;

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



//     public function store(Request $request)
//    {
//
//        $user = User::query()->where('email',$request->get('email'))->first();
//
//        if (!$user) {
//            $notifications = array(
//                'message' => 'Email Not Found',
//                'alert-type' => 'info',
//            );
//            return redirect()->back()->with($notifications);
//        }
//        $code = rand(111111,123456);
//
//        try {
//            DB::beginTransaction();
//            Verification::query()->create([
//                'user_id' => $user->id,
//                'code' => $code,
//                'expires_at' => Carbon::now()->addMinutes(10),
//                'created_at' => Carbon::now(),
//                'updated_at' => Carbon::now(),
//            ]);
//            DB::commit();
//
//            // Send this code user mobile phone
//            $msg = 'Your reset password code is : '. $code;
//
//            $sent = $this->sendSms($user->mobile , $msg);
//            if (!$sent) {
//                $notifications = array(
//                    'message' => 'Something went wrong try again later!',
//                    'alert-type' => 'error',
//                );
//                return redirect()->back()->with($notifications);
//            }
//
//            $notification = array(
//                'message' => 'Sms Sent Successfully',
//                'alert-type' => 'success'
//            );
//            return redirect()->route('check.code',encrypt($user->id))->with($notification);
//
//        } catch (\Exception $e) {
//            DB::rollBack();
//            $notifications = array(
//                'message' => 'Something went wrong try again later',
//                'alert-type' => 'error',
//            );
//            return redirect()->back()->with($notifications);
//        }
//
//
//        return $user->mobile;
//
//
//        $request->validate([Fortify::email() => 'required|email']);
//
//        // We will send the password reset link to this user. Once we have attempted
//        // to send the link, we will examine the response then see the message we
//        // need to show to the user. Finally, we'll send out a proper response.
//        $status = $this->broker()->sendResetLink(
//            $request->only(Fortify::email())
//        );
//
//        return $status == Password::RESET_LINK_SENT
//                    ? app(SuccessfulPasswordResetLinkRequestResponse::class, ['status' => $status])
//                    : app(FailedPasswordResetLinkRequestResponse::class, ['status' => $status]);
//    }
//
//
//    public function sendSms($mob_number , $code)
//    {
//        $sent = false;
//        $receiverNumber = '+20 ';
//        $mobile = $mob_number;
//        if (str_starts_with($mob_number, '0')) {
//            $mobile = substr($mob_number, 1);
//        }
//
//        $receiverNumber .= $mobile;
//        $message = $code;
//
//        try {
//            $twilio_number = '+16067332573';
//            $twilio_sid = getenv('TWILIO_SID');
//            $twilio_token = getenv('TWILIO_TOKEN');
//            $twilio_from = getenv('TWILIO_FROM');
//
//            $client = new Client($twilio_sid, $twilio_token);
//            $client->messages->create($receiverNumber, [
//                'from' => $twilio_from,
//                'body' => $message,
//            ]);
//
//            //            $notification = array(
//            //                'message' => 'Sms Sent Successfully',
//            //                'alert-type' => 'success'
//            //            );
//            $sent = true;
//            // return redirect()->back()->with($notification);
//        } catch (\Exception $e) {
//            $sent = false;
//        }
//        return $sent;
//    }
