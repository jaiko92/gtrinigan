@extends('voyager::master')

@section('page_title', __('Prestamo'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-eye"></i> Cuenta N° {{$cobrarcuenta->id}}
        </h1>
        <a href="{{ route('cobrarcuentas.index') }}" class="btn btn-warning">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            {{ __('voyager::generic.return_to_list') }}
        </a>
    </div>
@stop

@section('content')
<div class="page-content read container-fluid">
      <div class="panel panel-bordered" style="padding-bottom:5px;">
        <div class="panel-heading" style="border-bottom:0;">
               <h3 class="panel-title">CUENTA X COBRAR</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>CODIGO DE CARGA: </label>
                        {{$cobrarcuenta->carga->id}}
                    </div>
                    <div class="form-group">
                        <label>Cliente:</label>
                       {{$cobrarcuenta->carga->cliente->razon_social}}
                    </div>
                    <div class="form-group">
                        <label>Preco de Carga:</label> {{$cobrarcuenta->carga->precio_envio}}
                         <label>Deuda:</label> {{$cobrarcuenta->deuda}}
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Estado</label>
                        <p>{{$cobrarcuenta->estado}}</p>
                    </div>
                    <div class="form-group">
                        <label>Descripcion</label>
                        <pre class="pre">algo</pre>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Usuario</label>
                          <p>{{$cobrarcuenta->carga->user->name}}</p>
                    </div>
                    <div class="form-group">
                        <label>Fecha de registro</label>
                        <pre class="pre">{{$cobrarcuenta->created_at}}</pre>
                    </div>
                </div>
            </div>
            <hr>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Abonado</th>
                        <th>Feccha Abono</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cobrarcuenta->detalles as $detalle)
                        <tr>
                            <td class="table-name">{{$detalle->id}}</td>
                            <td class="table-qty">{{$detalle->abonado}}</td>
                            <td class="table-name">{{$detalle->created_at}}</td>         
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
