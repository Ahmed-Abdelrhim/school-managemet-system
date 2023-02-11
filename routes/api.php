<?php

use App\Http\Controllers\BackEnd\PlayController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('get/users',[PlayController::class,'getUsersForApi']);

Route::post('create/users',[PlayController::class,'createUserForApi']);



// Software Template
// https://themeforest.net/item/notech-it-solutions-services-drupal-theme/42598838 45$

// Preview
// https://previewthemes.com/notech/

// Design Patterns·······
// 1) Builder Pattern
// 2) Factory Pattern
// 3) Strategy Pattern
// 4) Provider Pattern
// 5) Repository Pattern
// 6) Facade Pattern


// downloaded => 2,3 then 7,8
