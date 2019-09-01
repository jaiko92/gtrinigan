<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;
use App\Owner;

class ExtractosController extends Controller
{
    public function clientes(){
        $clientes = Cliente::orderBy('id','desc')->get();
        return view('estractos.clientes', compact('clientes'));
    }

    public function camioneros () {
        $owners = Owner::orderBy('id','desc')->get();
        return view('estractos.camioneros', compact('owners'));
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

    public function camioneroxtracto(Request $request){
        $this->validate($request,[
            'inicio' => 'required',
            'fin' => 'required',
         ]);
        if (!empty($request->fin)) {
            $ini = $request->inicio;
            $fecha_fin = $request->fin;
            $owner = Owner::with(['vehiculo.detalles','vehiculo.detalles.cuenta','vehiculo.detalles.cuenta.detalles','vehiculo.detalles.vehiculo'])
                                            ->where('id',$request->owner_id)
                                            ->whereHas('vehiculo.detalles.cuenta', function ($query) use ( $ini,$fecha_fin){
                                                $query->whereBetween('created_at',[$ini,$fecha_fin]);
                                                })
                                                ->orderBy('id','desc')
                                                ->first();
        }
           $vista = view('reportes.camioneros', compact('owner','ini','fecha_fin'));
            $pdf = \App::make('dompdf.wrapper');
          //  $pdf->loadHTML($vista);
           $pdf->loadHTML($vista)->setPaper('a4', 'landscape');
            return $pdf->stream();    
    }
}
