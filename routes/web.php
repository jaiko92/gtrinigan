<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    return "Cache is cleared";
});
Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::resource('cargas','OrdenController');
    Route::get('/customers/selectCliente','OrdenController@selectCliente');
    Route::get('/address/selectRuta','OrdenController@selectRuta');
    Route::get('/vehicles/selectvehicle','OrdenController@selectVehicle');
    Route::get('/choferes/selectchofer','OrdenController@selectChofer');
    //ruta para el registro de las cuentas por cobrar
    Route::resource('cobrarcuentas','CobrarCuentaController');
    Route::post('abonar/{id}','CobrarCuentaController@storeabono')->name('abonar');
    //ruta para el registro de las cuentas por pagar
    Route::resource('pagarcuentas','PagarCuentaController');
    Route::post('pagar/{id}','PagarCuentaController@storeabono')->name('pagar');

    //rutas para generar los extractos de cuentas
    Route::get('extracto-clientes','ExtractosController@clientes')->name('extractoclientes');
    Route::post('generarclientes','ExtractosController@clientextracto')->name('clientesgenerar');

    //rutas para generar los extractos de Los camioneros
    Route::get('extracto-camioneros','ExtractosController@camioneros')->name('extractowners');
    Route::post('generarcamioneros','ExtractosController@camioneroxtracto')->name('ownergenerar');

});
