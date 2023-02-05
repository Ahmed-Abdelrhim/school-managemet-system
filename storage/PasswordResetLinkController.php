<?php

namespace Laravel\Fortify\Http\Controllers;

use App\Models\User;
use App\Models\Verification;

use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Contracts\Support\Responsable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;
use Laravel\Fortify\Contracts\FailedPasswordResetLinkRequestResponse;
use Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse;
use Laravel\Fortify\Contracts\SuccessfulPasswordResetLinkRequestResponse;
use Laravel\Fortify\Fortify;
use Twilio\Rest\Client;
use Illuminate\Support\Carbon;

class PasswordResetLinkController extends Controller
{
    /**
     * Show the reset password link request view.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Laravel\Fortify\Contracts\RequestPasswordResetLinkViewResponse
     */
    public function create(Request $request): RequestPasswordResetLinkViewResponse
    {
        return app(RequestPasswordResetLinkViewResponse::class);
    }

    /**
     * Send a reset link to the given user.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Contracts\Support\Responsable
     */
    public function store(Request $request)
    {
        $user = User::query()->where('email', $request->email)->first();
        if (!$user) {
            $notifications = ['message' => 'email was not found', 'alert-type' => 'error'];
            return redirect()->back()->with($notifications);
        }

        // TODO:: I need to send the message of verification code , redirect the user to check code page , and then verify the code
        $sms = false;
        $code = $this->generateVerificationCode($user->id);

        if ($code != 0 && strlen($code) == 4) {
            $sms = $this->sendSms($user->mobile, $code);
        }

        if ($sms) {
            $hashed_mobile_number = '+20 ' . 'XXX-XXX-XX-' . $user->mobile[-2] . $user->mobile[-1];
            $notifications = ['message' => 'Check your messages at ' . $hashed_mobile_number, 'alert-type' => 'success'];
            return redirect()->route('code.check.page',encrypt($user->email))->with($notifications);
        }
        $notifications = ['message' => 'Something went wrong try again', 'alert-type' => 'error'];
        return redirect()->back()->with($notifications);

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

    public function generateVerificationCode($user_id)
    {
        $code = random_int(1111, 9999);
        $insert = [
            'user_id' => $user_id,
            'code' => $code,
            'expires_at' => Carbon::now()->addMinutes(10)->toDateTimeString(),
            'is_valid' => 1,
            'created_at' => Carbon::now(),
        ];
        $code_created_successfully = false;
        try {
            DB::beginTransaction();
            Verification::query()->insert($insert);
            DB::commit();
            $code_created_successfully = true;
        } catch (\Exception $e) {
            DB::rollBack();
        }
        if ($code_created_successfully)
            return $code;
        return 0;
    }

    public function sendSms($phone_number, $message)
    {
        try {
        $account_sid = getenv("TWILIO_SID");
        $auth_token = getenv("TWILIO_TOKEN");

        $twilio_number = '+16067332573';

        $receiverNumber = '+20 ';

        if (str_starts_with($phone_number, '0')) {
            $mobile = substr($phone_number, 1);
        }

        $receiverNumber .= $phone_number;

        $client = new Client($account_sid, $auth_token);
        $client->messages->create($receiverNumber, [
            'from' => $twilio_number,
            'body' => 'Your verification code is [valid for ten mins]: ' . $message,
        ]);
            $is_sent = true;
        } catch (\Exception $e) {
            $is_sent = false;
        }
        return $is_sent;
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
