<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/signup', [AuthController::class, 'signup']);

Route::post('/login', [AuthController::class, 'login']);
// routes/api.php
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\CartController;

Route::get('/products', [ProductController::class, 'index']);
Route::post('/cart', [CartController::class, 'addToCart']);

Route::post('/logout', [AuthController::class, 'logout']);

