<?php

namespace App\Http\Controllers;

use App\Cuentaxpagar;
use App\Detallecuentaxpagar;
use Illuminate\Http\Request;

class PagarCuentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pagarcuentas = Cuentaxpagar::with(['detalle','detalle.vehiculo.owner'])
                                                   ->orderBy('id','desc')
                                                   ->paginate(10);
        return view('cuentasxpagar.index', compact('pagarcuentas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
     * @param  \App\Cuentaxpagar  $cuentaxpagar
     * @return \Illuminate\Http\Response
     */
    public function show(Cuentaxpagar $pagarcuenta)
    {
        return view('cuentasxpagar.show', compact('pagarcuenta'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Cuentaxpagar  $cuentaxpagar
     * @return \Illuminate\Http\Response
     */
    public function edit(Cuentaxpagar $cuentaxpagar)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Cuentaxpagar  $cuentaxpagar
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cuentaxpagar $cuentaxpagar)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Cuentaxpagar  $cuentaxpagar
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cuentaxpagar $cuentaxpagar)
    {
        //
    }
    public function storeabono(Request $request,$id){
        $cuenta = Cuentaxpagar::findOrFail($id);
        $det_cuenta = new Detallecuentaxpagar;
        $det_cuenta->cuenta_id = $cuenta->id;
        $det_cuenta->abonado = $request->abonado;
        
        $cuenta->deuda = $cuenta->deuda - $request->abonado;
        if($cuenta->deuda == 0) {
            $estado = Cuentaxpagar::FINALIZADO;
        }else {
            $estado = Cuentaxpagar::VIGENTE;
        }
        $cuenta->estado = $estado;
        $det_cuenta->save();
        $cuenta->save();
        return back()->with([
            'message' => "El pago se realizo con exito",
            'alert-type' => 'info'
        ]);
    }
}
