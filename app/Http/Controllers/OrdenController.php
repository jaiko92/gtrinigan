<?php

namespace App\Http\Controllers;

use App\Carga;
use App\Cliente;
use App\Ruta;
use Illuminate\Http\Request;

class OrdenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cargas = Carga::orderBy('id','desc')
                                    ->paginate(10);
        return view('ordenes.index', compact('cargas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('ordenes.create');
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
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function show(Carga $carga)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function edit(Carga $carga)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Carga $carga)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function destroy(Carga $carga)
    {
        //
    }

    public function selectCliente(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $clientes = Cliente::where('razon_social', 'like', '%'. $filtro . '%')
                                        ->orWhere('documento', 'like', '%'. $filtro . '%')
                                        ->orWhere('email', 'like', '%'. $filtro . '%')
                                        ->select('id','razon_social','documento')
                                        ->orderBy('id', 'asc')->get();
        return ['clientes' => $clientes];
    }
    public function selectRuta(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $rutas = Ruta::where('origen', 'like', '%'. $filtro . '%')
                                        ->orWhere('destino', 'like', '%'. $filtro . '%')
                                        ->select('id','origen','destino')
                                        ->orderBy('id', 'asc')->get();
        return ['rutas' => $rutas];
    }
}
