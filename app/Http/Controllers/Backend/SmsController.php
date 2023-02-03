<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Designation;
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
use Illuminate\Support\Str;
use Twilio\Rest\Client;
use Faker\Factory as Faker;

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

    public function play($id = null , $user_id = null)
    {
        $atef_token = '2|IWKLlmxMWVwwfanZdhRYezZbig8wzyoDtiZtFkm2';
        // $toke = '2|D1hmmwkKoW4nm9PtDcp6sulPN5yaQI3bSEE31Yfa';

        $login = 'http://127.0.0.1:1010/api/login';
        $uri = 'http://127.0.0.1:1010/api/post/' . $id;
        $create_post = 'http://127.0.0.1:1010/api/store/post';

        $atef_register_user = 'http://127.0.0.1:1070/api/register';
        $atef_login_user = 'http://127.0.0.1:1070/api/login';
        $atef_get_psa = 'http://127.0.0.1:1070/api/get/psa/'.$id;
        $atef_set_psa = 'http://127.0.0.1:1070/api/set/psa';

        //        $register = Http::withHeaders([
        //            'Authorization' => 'application/json',
        //            'Content-Type' => 'application/json',
        //        ])->post($atef_register_user, [
        //            '' => '',
        //        ]);

        //        $login = Http::post($atef_login_user,[
        //            'email' => 'abdelrhim.user@gmail.com',
        //            'password' => '12345678',
        //        ]);
        // return $login->json();




        // get psa ···
        // $get_psa_result = Http::withToken($atef_token)->get($atef_get_psa);
        // return $get_psa_result->json();

        // set psa ···
        $set_psa = Http::withToken($atef_token)->post($atef_set_psa,[
            'user_id' => 2,
            'psa_result' => 1,
        ]);

        // https://jsonplaceholder.typicode.com/posts/1



        return $set_psa->json();



        //        $store_post = Http::withToken($toke)->post($create_post,[
        //            'author_id' => 11,
        //            'title' => 'Title From School Management System',
        //            'content' => 'Content From School Management System',
        //        ]);
        //
        //        if ($store_post->json()['status'] == 400)
        //            return 'Something went wrong';
        //        return $store_post->json();

        //        $string = false;
        //        $blogPost = Http::withToken($toke)->get($uri);
        //
        //
        //        if ($blogPost->json()['status'] == 400)
        //            return 'BlogPost Not Found';
        //
        //        return $blogPost->json();
    }

    public function createUsers()
    {
        $faker = Faker::create();
        // Designation Create ···
        // $titles = ['Front-End Developer','Back-End Developer','Mobile Developer','Security','Software Tester','Ui/Ux','Graphic Designer','Data Analyst'];
        //        for ($i= 0 ; $i < count($titles) - 1 ; $i++) {
        //            Designation::query()->insert([
        //                'name' => $titles[$i],
        //                'created_at' => Carbon::now(),
        //            ]);
        //        }


        // Users Create ···
        //        $genders = ['Male','Female'];
        //        $religions = ['Muslim','Christian','Jewish','Atheist'];
        //        for ($i = 0 ; $i < 50 ; $i++) {
        //            User::query()->insert(
        //                [
        //                    'name' => $faker->name,
        //                    'email' => $faker->unique()->safeEmail,
        //                    'email_verified_at' => \Carbon\Carbon::now(),
        //                    'password' => bcrypt('12345678'), // password
        //                    'remember_token' => Str::random(10),
        //                    'mobile' => '01'.$faker->numberBetween(0,2) . $faker->numberBetween(0000000,9999999),
        //                    'usertype' => 'Admin',
        //                    'address' => $faker->address,
        //                    'gender' => $genders[$faker->numberBetween(0,1)],
        //                    'image' => '202301291300myPic-1.jpg',
        //                    'religion' => $religions[$faker->numberBetween(0,3)],
        //                    'dob' => $faker->dateTimeBetween('1970-01-01', '2012-12-31'),
        //                    'role' => 'Operator',
        //                    'created_at' => Carbon::now(),
        //                ]
        //            );
        //        }

        return 'Done';
    }

    public function databaseOptimization()
    {
        $designations = Designation::query()
            ->with('users:id,name,designation_id')
            ->get(['id','name']);

        // $users = User::query()->with('designation')->where('role','Admin')->get();
        return view('backend.user.play',['designations' => $designations]);
    }

}
// eyJpdiI6IlFmQlZiWENuR1dVT2VRMmxFK0cxTlE9PSIsInZhbHVlIjoiUXlIcnhZV25GRUlaa2FOUWtlNmlxQT09IiwibWFjIjoiYTlkYTA1MWZhOWIzMTYwMjU4NTFkYzY0NzRmZGQ1Y2U1NWQyM2JhZDY3ODI0MGE0ZjliNzE1NzBiMWUzYTQ2YSIsInRhZyI6IiJ9
