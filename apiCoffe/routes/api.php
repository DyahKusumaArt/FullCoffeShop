<?php

use App\Http\Controllers\cartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MakananController;

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

Route::apiResource('Makanan', MakananController::class);
Route::get('/makanan', [MakananController::class, 'getFood']);
Route::get('/minuman', [MakananController::class, 'getDrink']);
Route::get('/makanan/{id_food}', [MakananController::class, 'getFoodById']);
Route::get('/minuman/{id_food}', [MakananController::class, 'getDrinkById']);
Route::get('/cart', [cartController::class, 'showCart']);
Route::get('/cart/{id_cart}', [cartController::class, 'getCart']);
Route::post('/cart', [cartController::class, 'pushCart']);
Route::delete('/cart/{id_cart}', [cartController::class, 'destroy']);
Route::patch('/cart/{id_cart}', [cartController::class, 'update']);
