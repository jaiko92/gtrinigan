<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cuenta;
use App\Carga;
use App\DetalleCuenta;

class CobrarCuentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function index(){
        
        $cobrarcuentas = Cuenta::with(['carga','carga.cliente'])
                                                   ->orderBy('id','desc')
                                                   ->paginate(10);
        return view('cuentasxcobrar.index', compact('cobrarcuentas'));
    }

    public function show(Cuenta $cobrarcuenta){
        return view('cuentasxcobrar.show', compact('cobrarcuenta'));
    }

    public function storeabono(Request $request,$id){
        $cuenta = Cuenta::findOrFail($id);
        $det_cuenta = new DetalleCuenta;
        $det_cuenta->cuenta_id = $cuenta->id;
        $det_cuenta->abonado = $request->abonado;
        
        $cuenta->deuda = $cuenta->deuda - $request->abonado;
        if($cuenta->deuda == 0) {
            $estado = Cuenta::FINALIZADO;
        }else {
            $estado = Cuenta::VIGENTE;
        }
        $cuenta->estado = $estado;
        $det_cuenta->save();
        $cuenta->save();
        return back()->with([
            'message' => "agregado",
            'alert-type' => 'info'
        ]);
    }





}
