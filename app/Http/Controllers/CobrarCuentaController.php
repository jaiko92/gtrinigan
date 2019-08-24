<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cuenta;
use App\Carga;
use App\Detalle;

class CobrarCuentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function index(){
        $cuentas = Cuenta::with(['carga','carga.cliente' ])->get();
        return view('cuentasxcobrar.index', compact('cuentas'));
    }

    public function store(){

    	$cuenta = new Cuenta;

    	
    }




}
