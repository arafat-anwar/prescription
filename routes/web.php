<?php
Route::get('please-roopokar-please-reboot-me', function() {
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    file_put_contents(storage_path('logs/laravel.log'),'');
    Artisan::call('key:generate');
    Artisan::call('config:cache');
    return '<center><h1>System Rebooted!</h1></center>';
});

Auth::routes();

Route::get('/', function(){
	return redirect('dashboard');
});