<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;

class ExtractosController extends Controller
{
    public function clientes(){
        $clientes = Cliente::orderBy('id','desc')->get();
        return view('estractos.clientes', compact('clientes'));
    }
    public function clientextracto (Request $request) {
        $this->validate($request,[
            'inicio' => 'required',
            'fin' => 'required',
         ]);
        if (!empty($request->fin)) {
            $ini = $request->inicio;
            $fecha_fin = $request->fin;
            $clientes = Cliente::with(['cargas','carga.products','carga.cuenta','carga.cuenta.detalles'])
            ->whereHas('cargas', function ($query) use ( $ini,$fecha_fin){
                $query->whereBetween('created_at',[$ini,$fecha_fin]);
                })
                ->orderBy('id','desc')
                ->get();
        }
           $vista = view('reportes.clientes', compact('clientes'));
            $pdf = \App::make('dompdf.wrapper');
          //  $pdf->loadHTML($vista);
           $pdf->loadHTML($vista)->setPaper('a4', 'landscape');
            return $pdf->stream();    
    }
}
