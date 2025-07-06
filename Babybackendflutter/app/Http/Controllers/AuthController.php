<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;


class AuthController extends Controller
{
     public function signup(Request $request)
    {
        $request->validate([
            'name'     => 'required|string|max:255',
            'email'    => 'required|email|unique:users',
            'password' => 'required|min:6',
        ]);

        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'status' => true,
            'message' => 'User registered successfully',
            'data' => $user
        ], 201);
    }
    public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    $validator = Validator::make($credentials, [
        'email' => 'required|email',
        'password' => 'required|string|min:6',
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 422);
    }

    if (!$token = JWTAuth::attempt($credentials)) {
        return response()->json(['error' => 'Invalid email or password'], 401);
    }

    return response()->json([
        'status' => true,
        'token' => $token,
        'user' => Auth::user(),
    ]);
}
public function logout(Request $request)
{
    try {
        // Get token from header and invalidate
        $token = JWTAuth::getToken();
        if (!$token) {
            return response()->json(['status' => false, 'message' => 'Token not provided'], 400);
        }

        JWTAuth::invalidate($token);

        return response()->json([
            'status' => true,
            'message' => 'User logged out successfully',
        ]);
    } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
        return response()->json([
            'status' => false,
            'message' => 'Token is invalid',
        ], 401);
    } catch (\Exception $e) {
        return response()->json([
            'status' => false,
            'message' => 'Something went wrong',
        ], 500);
    }
}

}
