<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BaseController;


Route::prefix('api')->group(function () {
    Route::get('products', [BaseController::class, 'products']);
    Route::post('checkout', [BaseController::class, 'checkout']);
    Route::get('users/{id}/children', [BaseController::class, 'getChildren']);
    Route::get('users/revenues', [BaseController::class, 'getRevenues']);
    Route::get('users/profile', [BaseController::class, 'profile']);
    Route::post('login', [BaseController::class, 'login']);
});

Route::get('/login', function () {
    return view('login');
})->name('login');

Route::get('/users/children', function () {
    return view('userChildren');
})->name('children');

Route::get('/users/revenues', function () {
    return view('revenue');
})->name('revenue');

Route::get('/', function () {
    return view('welcome');
})->name('home');

