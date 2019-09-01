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
            $cliente = Cliente::with(['cargas','cargas.products','cargas.cuenta','cargas.cuenta.detalles'])
                                            ->where('id',$request->cliente_id)
                                            ->whereHas('cargas', function ($query) use ( $ini,$fecha_fin){
                                                $query->whereBetween('created_at',[$ini,$fecha_fin]);
                                                })
                                                ->orderBy('id','desc')
                                                ->first();
        }
           $vista = view('reportes.clientes', compact('cliente','ini','fecha_fin'));
            $pdf = \App::make('dompdf.wrapper');
          //  $pdf->loadHTML($vista);
           $pdf->loadHTML($vista)->setPaper('a4', 'landscape');
            return $pdf->stream();    
    }
}
