@extends('voyager::master')
@section('page_header')
  <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-list-add"></i> Nuevo Registro 
        </h1>
    </div>
@stop
@section('content')
<div class="container-fluid">
	 <div id="carga">
         <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="panel panel-bordered" v-cloak>
                    <div class="panel-heading">
                        <h3 class="panel-title">
									Datos del registro
                        </h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-angle-down" data-toggle="panel-collapse" aria-hidden="true"></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        @include('ordenes.form')
                    </div>
                    <div class="panel-footer">
                        <a href="{{route('cargas.index')}}" class="btn btn-default">CANCEL</a>
                        <button class="btn btn-success" @click="create" :disabled="isProcessing">Crear</button>
                    </div>
                </div>
         </div>   
    </div>
</div>
@stop
@section('css')
    <link rel="stylesheet" href="{{asset('css/vue-select.css')}}">
@endsection
@section('javascript')
     <script src="{{asset('js/vue.js')}}"></script> 
    <script src="{{asset('js/vue-resource.min.js')}}"></script>
    <script src="{{asset('js/vue-select.js')}}"></script>
    <script type="text/javascript">
        //axios.defaults.headers.common['X-CSRF-TOKEN'] = // YOUR CSRF TOKEN;
        Vue.http.headers.common['X-CSRF-TOKEN'] = '{{csrf_token()}}';
        Vue.component('v-select', VueSelect.VueSelect);
        window._form = {
            arrayCliente:[],
            arrayRuta: [],
            arrayVehicle: [],
            arrayChoferes: [],
            ruta: '',
            client: '',
            client_id: '',
            cantidad_reses: '',
            anticipo: '',
            precio_envio: '',
            products: [{
                vehiculo_id: '',
                vehiculo: '',
                chofer_id: '',
                chofer:'',
                capacidad: 0,
                cantidad: 1,
                observacion: '',
                precio: 0,
                anticipo: 0,
                comision: 0
            }]
        };
    </script>
    <script src="{{asset('js/carga.js')}}"></script>
@stop