<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;


class CartController extends Controller
{

public function addToCart(Request $request)
{
    $request->validate([
        'user_id' => 'required|exists:users,id',
        'product_id' => 'required|exists:products,id',
        'quantity' => 'required|integer|min:1',
    ]);

    $cartItem = CartItem::create($request->only('user_id', 'product_id', 'quantity'));

    return response()->json([
        'status' => true,
        'message' => 'Product added to cart successfully',
        'data' => $cartItem
    ], 200);
}


}
