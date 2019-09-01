@extends('voyager::master')

@section('page_title', __('Consulta'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-eye"></i> Orden de Carga N° {{$carga->id}}
        </h1>
        <a href="{{ route('cargas.index') }}" class="btn btn-warning">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            {{ __('voyager::generic.return_to_list') }}
        </a>
    </div>
@stop

@section('content')
<div class="page-content read container-fluid">
      <div class="panel panel-bordered" style="padding-bottom:5px;">
        <div class="panel-heading" style="border-bottom:0;">
               <h3 class="panel-title">Cargas</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Carga No.</label>
                        <p>{{$carga->id}}</p>
                    </div>
                    <div class="form-group">
                        <label>Usuario</label>
                        <p>{{$carga->user->name}}</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Ruta</label>
                        <p>Origen: {{$carga->ruta->origen}}  Destino: {{$carga->ruta->destino}}</p>
                    </div>
                    <div class="form-group">
                        <label>Observacion</label>
                        <pre class="pre">{{$carga->observacion}}</pre>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Cliente:</label>
                          {{$carga->cliente->razon_social}}
                    </div>
                    <div class="form-group">
                        <label>Anticipo</label>
                          {{$carga->anticipo}}
                    </div>
                    <div class="form-group">
                        <label>Cantidad de Reses</label>
                          {{$carga->cantidad_reses}}
                    </div>
                </div>
            </div>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Placa Vehiculo</th>
                            <th>Chofer</th>
                            <th>Cantidad reses</th>
                            <th>Observacion</th>
                            <th>Precio</th>
                            <th>SubTotal</th>
                            <th>Anticipo</th>
                            <th>Comision</th>
                             <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($carga->products as $product)
                            <tr>
                                <td>{{$product->vehiculo->placa}}</td>
                                <td>{{$product->chauffeur->nombres}}</td>
                                <td>{{$product->cantidad}}</td>
                                <td>{{$product->observacion}}</td>
                                <td>{{$product->precio}}</td>
                                <td>{{$product->subtotal}}</td>
                                <td>{{$product->anticipo}}</td>
                                <td>{{$product->comision}}</td>
                                 <td>{{$product->total}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                     <tfoot> <!-- Pie de tabla -->
                        <tr>
                            <th>Total Envio</th>
                            <th colspan="8" style="text-align:right">{{$carga->precio_envio}}</th>        
                        </tr>
                        <tr>
                            <th>Total Anticipos</th>
                            <th colspan="8" style="text-align:right">{{$carga->products->sum('anticipo')}}</th>        
                        </tr>
                        <tr>
                            <th>Total Comision</th>
                            <th colspan="8" style="text-align:right">{{$carga->products->sum('comision')}}</th>        
                        </tr>
                        <tr>
                            <th>Total Pagos Transporte</th>
                            <th colspan="8"style="text-align:right">{{$carga->pago_transporte}}</th>        
                        </tr>
                         <tr>
                            <th>Cantidad reses llevadas</th>
                            <th colspan="8" style="text-align:right">{{$carga->cant_llevadas}}</th>        
                        </tr>
                    </tfoot>
                </table>
            </div>
           
        </div>
    </div>
</div>
@stop


@section('css')
   
@stop

@section('javascript')
  
@stop
