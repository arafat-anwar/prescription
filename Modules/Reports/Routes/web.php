<?php

Route::prefix('reports')->group(function() {
    Route::get('/', 'ReportsController@index');
});
