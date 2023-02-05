<?php

namespace Laravel\Fortify\Http\Controllers;

use App\Models\User;
use App\Models\Verification;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Contracts\Support\Responsable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\FailedPasswordResetLinkRequestResponse;
use Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse;
use Laravel\Fortify\Contracts\SuccessfulPasswordResetLinkRequestResponse;
use Laravel\Fortify\Fortify;
use Twilio\Rest\Client;

class PasswordResetLinkController extends Controller
{
    /**
     * Show the reset password link request view.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse
     */
    public function create(Request $request): RequestPasswordResetLinkViewResponse
    {
        return app(RequestPasswordResetLinkViewResponse::class);
    }

    /**
     * Send a reset link to the given user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Contracts\Support\Responsable
     */
    public function store(Request $request)
    {

        $user = User::query()->where('email',$request->get('email'))->first();

        if (!$user) {
            $notifications = array(
                'message' => 'Email Not Found',
                'alert-type' => 'info',
            );
            return redirect()->back()->with($notifications);
        }
        $code = rand(111111,123456);

        try {
            DB::beginTransaction();
            $insert_code = Verification::query()->create([
                'user_id' => $user->id,
                'code' => $code,
                'expires_at' => Carbon::now()->addMinutes(10),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
            DB::commit();

            // Send this code user mobile phone
            $msg = 'Your reset password code is : '. $code;

            $sent = $this->sendSms($user->mobile , $msg);
            if (!$sent || !$insert_code) {
                $notifications = array(
                    'message' => 'Something went wrong try again later!',
                    'alert-type' => 'error',
                );
                return redirect()->back()->with($notifications);
            }

            $notification = array(
                'message' => 'Sms Sent Successfully',
                'alert-type' => 'success'
            );
            return redirect()->route('check.code',encrypt($user->id))->with($notification);

        } catch (\Exception $e) {
            DB::rollBack();
            $notifications = array(
                'message' => 'Something went wrong try again later',
                'alert-type' => 'error',
            );
            return redirect()->back()->with($notifications);
        }


        return $user->mobile;


        $request->validate([Fortify::email() => 'required|email']);

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $status = $this->broker()->sendResetLink(
            $request->only(Fortify::email())
        );

        return $status == Password::RESET_LINK_SENT
                    ? app(SuccessfulPasswordResetLinkRequestResponse::class, ['status' => $status])
                    : app(FailedPasswordResetLinkRequestResponse::class, ['status' => $status]);
    }


    public function sendSms($mob_number , $code)
    {
        $sent = false;
        $receiverNumber = '+20 ';
        $mobile = $mob_number;
        if (str_starts_with($mob_number, '0')) {
            $mobile = substr($mob_number, 1);
        }

        $receiverNumber .= $mobile;
        $message = $code;

        try {
            $twilio_number = '+16067332573';
            $twilio_sid = getenv('TWILIO_SID');
            $twilio_token = getenv('TWILIO_TOKEN');
            $twilio_from = getenv('TWILIO_FROM');

            $client = new Client($twilio_sid, $twilio_token);
            $client->messages->create($receiverNumber, [
                'from' => $twilio_from,
                'body' => $message,
            ]);

            //            $notification = array(
            //                'message' => 'Sms Sent Successfully',
            //                'alert-type' => 'success'
            //            );
            $sent = true;
            // return redirect()->back()->with($notification);
        } catch (\Exception $e) {
            $sent = false;
        }
        return $sent;
    }


    /**
     * Get the broker to be used during password reset.
     *
     * @return \Illuminate\Contracts\Auth\PasswordBroker
     */
    protected function broker(): PasswordBroker
    {
        return Password::broker(config('fortify.passwords'));
    }
}
