<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Proforma de venta</title>
        <style>
            .btn-print{
                background-color: #fa2a00;
                color:white;
                border: 1px solid #fa2a00;
                padding: 5px 8px;
                border-radius:5px
            }
            @media print {
                #print{
                    display: none;
                }
            }
            body{
                font-size: 11px;
                font-family: 'Noto Sans', sans-serif;
                /* border: 1px solid black;
                border-radius: 1px; */
                padding: 5px 10px;
                margin: 0px
            }

			@media all {
			   div.saltopagina{
			      display: none;
			   }
			}

			@media print{
			   div.saltopagina{
			      display:block;
			      page-break-before:always;
			   }
			}
		</style>
    </head>
    <body>
        <table width="100%">
                    <tr>
                        <td width="30%" align="center" style="font-size:7px">
                            <img src="{{url('storage').'/'.setting('empresa.logo')}}" alt="loginweb" width="60px"><br>
                            <b>{{setting('empresa.nombre')}}</b><br>

                            @if(setting('empresa.telefono')!='')
                            <b>Telf: {{setting('empresa.telefono')}}</b>
                            @endif
                            @if(setting('empresa.telefono')!='' && setting('empresa.celular')!='')
                                -
                            @endif
                            @if(setting('empresa.celular')!='')
                            <b>Cel: {{setting('empresa.celular')}}</b><br>
                            @endif

                            <b>{{setting('empresa.direccion')}}</b><br>
                            <b>{{setting('empresa.ciudad')}}</b><br>
                        </td>
                        <td width="70%" align="center"><span style="margin-bottom:0px;font-weight:bold;font-size:25px">EXTRACTO </span></td>
                    </tr>
                </table>
                {{-- datos de la venta --}}
                {{-- <div style="height:20px"></div> --}}
                <table width="90%" align="center">
                    <tr>
                        <td><b>Razón social</b></td>
                        <td>: {{$owner->fullName}}</td>
                        <td align="right"><b>Phone:</b></td>
                        <td>: {{$owner->celular}}</td>
                    </tr>
                    <tr>
                        <td><b>Fecha</b></td>
                        <td>desde:{{$ini}} hasta: {{$fecha_fin}}</td>
                        <td align="right"><b>Ubicación</b></td>
                        <td>: {{setting('empresa.ciudad')}}</td>
                    </tr>
                </table>
                <br>
                 <br>
                {{-- detalle de las cuentas --}}
                @forelse ($owner->vehiculo->detalles as $item)
                      <table width="100%" align="center">
                            <tr>
                                <td><b>Codigo de Cuenta</b></td>
                                <td>{{$item->cuenta->id}}</td>
                                <td align="right"><b>Placa Camion</b></td>
                                <td>{{$item->vehiculo->placa}}</td>
                            </tr>
                            <tr>
                                <td><b>Precio carga</b></td>
                                <td>{{number_format($item->subtotal)}}</td>
                                <td align="right"><b>Anticipo</b></td>
                                <td>{{number_format(($item->anticipo), 2, ',', '.')}}</td>
                            </tr>
                            <tr>
                               <td><b>Estado de Cuenta</b></td>
                               <td>{{$item->cuenta->estado}}</td>
                               <td align="right"><b>Debe de Empresa</b></td>
                                <td>{{number_format(($item->total), 2, ',', '.')}}</td>
                            </tr>
                        </table>
                     <table width="100%" border="1px" cellspacing="0" cellpadding="2">
                        <tr style="background-color:#022A81;color:#fff">
                            {{-- <td align="center" width="80px"><b>Código</b></td> --}}
                            <td align="center"><b>Pago de empresa</b></td>
                            <td align="center"><b>Fecha</b></td>
                        </tr>
                        @foreach ($item->cuenta->detalles as $detail)
                            <tr>
                                <td align="center">{{number_format(($detail->abonado), 2, ',', '.')}}</td>
                                {{-- <td>{{$detail->codigo}}</td> --}}
                                <td align="center">{{$detail->created_at}} &nbsp; {{$detail->created_at->diffForHumans()}}</td>
                            </tr>
                        @endforeach
                        <tr>
                            <td colspan="1" style="text-align:left"><b>TOTAL PAGOS.</b></td>
                            <td style="text-align:right"><b>{{$item->cuenta->detalles->count()}}</b></td>
                        </tr>
                    </table>   
                @empty
                        <p>
                            No tiene ninguna cuenta asociada
                        </p>
                @endforelse
                
                {{-- <div style="height:10px"></div> --}}
               
                
        <script>
            // window.print();
            // setTimeout(function(){
            //     window.close();
            // }, 10000);
        </script>
    </body>
</html>

