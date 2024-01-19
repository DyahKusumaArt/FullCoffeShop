<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class cartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showCart()
    {
        $cartItems = Cart::with('food')->get();
        return response()->json($cartItems);
    }
    public function getCart($id_cart)
    {
        $cartItem = Cart::with('food')->where('id_cart', $id_cart)
            ->first(); // Use 'first' to retrieve a single record

        if ($cartItem) {
            return response()->json($cartItem);
        } else {
            return response()->json(['error' => 'Food not found'], 404);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function pushCart(Request $request)
    {
        // Validate incoming data
        $validatedData = $request->validate([
            // Define validation rules based on your model
            'id_food' => 'required|integer',  // Ensure food exists
            'jumlah' => 'required|integer|min:1',
            'note' => 'nullable|string',
        ]);

        // Create a new model instance
        $cartItem = Cart::create($validatedData);

        return response()->json([
            'message' => 'Data stored successfully',
            'data' => $cartItem,
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id_cart)
    {
        $cartItem = Cart::find($id_cart);
        $cartItem->jumlah = $request->jumlah;
        $cartItem->note = $request->note;
        $cartItem->save();
 
        return response()->json($cartItem);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_cart)
    {
        Cart::destroy($id_cart);
        return response()->json(['message' => 'Deleted']);
    }
}
