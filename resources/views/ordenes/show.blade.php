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
                        <label>Motivo Consulta</label>
                        <pre class="pre">{{$carga->id}}</pre>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Cliente</label>
                          <p>{{$carga->cliente->razon_social}}</p>
                    </div>
                </div>
            </div>
            <hr>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Vehiculo</th>
                        <th>Chofer</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($carga->products as $product)
                        <tr>
                            <td class="table-name">{{$product->vehiculo_id}}</td>
                            <td class="table-qty">{{$product->chofer_id}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@stop


@section('css')
   
@stop

@section('javascript')
  
@stop
