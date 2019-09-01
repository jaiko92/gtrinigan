@extends('voyager::master')

@section('page_title', __('Consulta'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-eye"></i>Generar Estracto
        </h1>
    </div>
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
           <div class="col-md-12">
              <div  class="panel panel-bordered">
                    <form action="{{route('clientesgenerar')}}" method="POST" target="_blank">
                    @csrf
                    <div class="panel-body">
                            @if (count($errors) > 0)
                                        <div class="alert alert-danger">
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                    <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                            @endif
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Seleccione el Cliente</label>
                                    <select class="form-control select2" name="cliente_id">
                                    @foreach ($clientes as $cliente)
                                        <option value="{{$cliente->id}}">{{$cliente->razon_social}} - {{$cliente->documento}}</option>
                                    @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="inicio">Fecha Inicio</label>
                                    <input type="date" name="inicio" class="form-control"></input>
                                </div>
                            </div>
                            <div class="col-md-4">
                               <div class="form-group">
                                   <label for="fin">Fecha Fin</label>
                                    <input type="date" name="fin" class="form-control"></input>
                                 </div>
                            </div>
                            
                    </div>
                    <div class="panel-footer">
                       <div class="text-rigth">
                         <button type="submit" class="btn btn-primary save">{{ __('Generar') }}</button>
                       </div>
                    </div>
                    
                    </form>
              </div>
           
           </div>
        </div>
    </div>

@stop


@section('css')
   
@stop

@section('javascript')
  
@stop