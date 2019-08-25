@extends('voyager::master')
@section('page_title', 'Cuentas por cobrar')
    @section('page_header')
        <h1 class="page-title">
            <i class="voyager-home"></i> Lista Cuentas por Cobrar
        </h1>
        <a href="" class="btn btn-danger btn-add-new"> lista PDF
            <i class=""></i> <span></span>
        </a>
    @stop
    @section('content')
        <div class="page-content">
            <div class="page-content browse container-fluid">
                @include('voyager::alerts')
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-bordered">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-8"></div>
                                        <form id="form-search" class="form-search">
                                            <div class="input-group col-md-4">
                                                <input type="text" id="search_value" class="form-control" name="s" value="" placeholder="Buscar : Cliente, Carga,Estado">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" style="margin-top:0px;padding:5px 10px" type="submit">
                                                        <i class="voyager-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-md-2">Codigo carga</th>
                                                <th >Cliente</th>
                                                <th class="col-md-2">Costo carga</th>
                                                <th class="col-md-2">Deuda</th>
                                                 <th class="col-md-1">Estado</th>
                                                <th class="col-md-3" class="actions text-right">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                                @foreach($cuentas  as $cuenta)
                                                <tr>
                                                    <td>{{$cuenta->carga->id}}</td>
                                                    <td>{{$cuenta->carga->cliente->razon_social}}</td>
                                                    <td>{{$cuenta->carga->precio_envio}}</td>
                                                    <td>{{$cuenta->deuda}}</td>
                                                    <td>{{$cuenta->estado}}</td>
                                                    <td class="no-sort no-click" id="bread-actions">
                                                       @if($cuenta->estado != "finalizado")
                                                           <a href="javascript:;" title="pagar" class="btn btn-sm btn-primary delete" data-id="{{$cuenta->id}}" id="delete-{{$cuenta->id}}">
                                                            <span class="hidden-xs hidden-sm">Abonar</span>
                                                           </a>
                                                       @endif
                                                        <button class="btn btn-warning" 
                                                            data-id="" data-toggle="modal" data-target="#modal_detalleCxC">Ver
                                                        </button>
                                                         <button class="btn btn-success fade" 
                                                            data-id="" data-toggle="modal" data-target="#modal_detalleCxC">mov..
                                                        </button>
                                                    </td>
                                                </tr>
                                                @endforeach
                                            <tr>
                                                <td colspan="6"><p class="text-center"><br>No hay registros para mostrar.</p></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- modal pagar cuentas --}}
        <form action="" method="POST">
               @csrf
            <div class="modal modal-primary fade" tabindex="-1" id="modal_abonar" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Formulario agregar Pagos 
                            </h4>
                        </div>

                        <div class="modal-body">
                            <form role="form" action="POST">
                                  <div class="box-body">
                                     <div class="row ">
                                        <div class="col-md-12 offset-md-3">
                                            <div class="form-group">
                                                 <label class="h4">Ingrese el Monto :</label>
                                                <input type="number" class="form-control" id="input-monto" placeholder="00.Bs">
                                            </div>
                                         </div>
                                    </div>
                                </div>
                          </form>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="">
                            <input  type="submit" class="btn btn-primary pull-right "value="Agregar">
                            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">
                                Cancelar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        {{-- modal Ver Detalle cuentas x pogar --}}
        <form action="" method="POST">

            <div class="modal modal-warning fade" tabindex="-1" id="modal_detalleCxC" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Detalle Cuentas por cobrar
                            </h4>
                        </div>

                        <div class="modal-body">
                            <form role="form">
                                  <div class="box-body">
                                    <div><h2>Monto Total Carga : </h2></div>
                                    <hr>
                                      <div class="row">
                                                <div class="col-md-12">
                                                     <table class="table table-bordered table-hover">
                                                            <thead>
                                                                  <tr>
                                                                        <th>N°</th>
                                                                        <th>Deuda</th>
                                                                        <th>Abonado</th>
                                                                        <th>Fecha</th>
                                                                  </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>1000 bs</td>
                                                                    <td>500  bs</td>
                                                                    <td>13/09/2019</td>
                                                                </tr>
                                                            </tbody>
                                                     </table>   
                                               </div>
                                        </div>
                                   </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="id" value="">
                            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">
                                volver
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

         {{-- Single delete modal --}}
    <div class="modal modal-primary fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-plus"></i> {{ __('Formulario pagar :') }} </h4>
                </div>
                <div class="modal-footer">
                    <form action="#" id="delete_form" method="POST">
                        {{ csrf_field() }}
                        <div class="box-body">
                            <div class="row ">
                               <div class="col-md-12 offset-md-3">
                                   <div class="form-group text-center">
                                        <label class="h4">Ingrese el Monto :</label>
                                       <input type="number" name="abonado" class="form-control" placeholder="00.Bs">
                                   </div>
                                </div>
                           </div>
                        </div>
                       <input type="submit" class="btn btn-primary pull-right delete-confirm" value="{{ __('Guardar') }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    @stop
    @section('css')
        <style>

        </style>
    @stop
    @section('javascript')
        <script>
            $(document).ready(function(){
                //pasar datos frm editar
                // $(".btn-edit").click(function(){
                //     let monto = $(this).data("monto")
                //    $("#input-monto").val(monto)
                // })
                 var deleteFormAction;
            $('td').on('click', '.delete', function (e) {
                $('#delete_form')[0].action = '{{ route('abonar', ['id' => '__id']) }}'.replace('__id', $(this).data('id'));
                $('#delete_modal').modal('show');
            });
            })
           
        </script>
    @stop


    @section('content')
        
    @stop

