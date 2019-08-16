@extends('voyager::master')
@section('page_title', __('Consultas'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-logbook"></i> Lista de Envios
        </h1>
           <a href="{{route('cargas.create')}}" class="btn btn-success btn-add-new">
                <i class="voyager-plus"></i> <span>{{ __('Añadir nuevo') }}</span>
           </a>  
    </div>
@stop
@section('content')
     <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="panel-title">Cargas</span>
            </div>
        </div>
        <div class="panel-body">
            @if($cargas->count())
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Cliente</th>
                        <th>Ruta</th>
                        <th>Cantidad-Reses</th>
                        <th>Costo Carga</th>
                        <th>Anticipo</th>
                        <th colspan="2">Fecha de Creacion</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cargas as $carga)
                        <tr>
                            <td>{{$carga->cliente_id}}</td>
                            <td>{{$carga->ruta_id}}</td>
                            <td>{{$carga->cantidad_reses}}</td>
                            <td>{{$carga->precio_envio}}</td>
                            <td>{{$carga->anticipo}}</td>
                            <td>{{$carga->created_at->diffForHumans()}}</td>
                            <td class="text-right">
                                <a href="{{route('cargas.show', $carga)}}" class="btn btn-default btn-sm">Ver</a>
                                <form class="form-inline" method="post"
                                    action="{{route('cargas.destroy', $carga)}}"
                                    onsubmit="return confirm('¿Estás seguro?')"
                                >
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                                    <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            {!! $cargas->render() !!}
            @else
                <div class="invoice-empty">
                    <p class="invoice-empty-title">
                       No se han creado aun ningun envio de cargas
                    </p>
                </div>
            @endif
        </div>
    </div>
@endsection
@section('css')
@stop
@section('javascript')
 <script>
    
 </script>
@stop