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
         <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-bordered">
                            <div class="panel-body">
                                @if($cargas->count())
                                    <div class="table-responsive">
                                          <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Cliente</th>
                                                    <th>Ruta origen</th>
                                                    <th>Ruta destino</th>
                                                    <th>Cantidad-Reses</th>
                                                    <th>Costo Carga</th>
                                                    <th>Anticipo</th>
                                                    <th>Fecha de Creacion</th>
                                                    <th class="col-md-1">Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 @php setlocale(LC_ALL, 'es_ES'); @endphp
                                                @foreach($cargas as $carga)
                                                    <tr>
                                                        <td>{{$carga->cliente->razon_social}}</td>
                                                        <td>{{$carga->ruta->origen}}</td>
                                                         <td>{{$carga->ruta->destino}}</td>
                                                        <td>{{$carga->cantidad_reses}}</td>
                                                        <td>{{$carga->precio_envio}} Bs</td>
                                                        <td>{{$carga->anticipo}} Bs</td>
                                                        <td>{{$carga->created_at->diffForHumans()}}</td>
                                                        <td>
                                                            <a href="{{route('cargas.show', $carga)}}" class="btn btn-default btn-sm">Ver
                                                            </a>
                                                            <form class="form-inline" method="post"
                                                                action="{{route('cargas.destroy', $carga)}}"
                                                                onsubmit="return confirm('¿Estás seguro?')">
                                                                <input type="hidden" name="_method" value="delete">
                                                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                                                <input class="btn btn-danger pull-left" type="submit" value="delete">
                                                            </form>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                         </table>
                                    </div>
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
                  </div>
    </div>
@endsection
@section('css')
@stop
@section('javascript')
 <script>
    
 </script>
@stop