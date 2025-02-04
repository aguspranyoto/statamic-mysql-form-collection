<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormController;

Route::post('/form-submit', [FormController::class, 'submit'])->name('form.submit');
Route::get('/reload-captcha', [FormController::class, 'reloadCaptcha']);
Route::post('/add-comment/{id}', [FormController::class, 'addComment'])->name('form.addComment');