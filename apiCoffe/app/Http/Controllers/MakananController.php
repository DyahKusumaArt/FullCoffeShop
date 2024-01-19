<?php

namespace App\Http\Controllers;

use App\Models\Makanan;
use Illuminate\Http\Request;

class MakananController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $makananAll = Makanan::get();
        return response()->json($makananAll);
    }

    public function getFood()
    {
        $makanan = Makanan::where('fodOrDrink', 'food')->get();
        // Do something with the $food collection, e.g., return it as JSON
        return response()->json($makanan);
    }

    public function getDrink()
    {
        $minuman = Makanan::where('fodOrDrink', 'drink')->get();
        // Do something with the $drink collection
        return response()->json($minuman);
    }

    public function getFoodById($id_food)
    {
        $makanan = Makanan::where('fodordrink', 'food')
            ->where('id_food', $id_food)
            ->first(); // Use 'first' to retrieve a single record

        if ($makanan) {
            return response()->json($makanan);
        } else {
            return response()->json(['error' => 'Food not found'], 404);
        }
    }
    public function getDrinkById($id_food)
    {
        $minuman = Makanan::where('fodordrink', 'drink')
            ->where('id_food', $id_food)
            ->first(); // Use 'first' to retrieve a single record

        if ($minuman) {
            return response()->json($minuman);
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
    public function store(Request $request)
    {
       //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id_food
     * @return \Illuminate\Http\Response
     */
    public function show($id_food)
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
