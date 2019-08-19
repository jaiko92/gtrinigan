<?php

namespace App\Http\Controllers;

use App\Carga;
use App\Detalle;
use App\Cliente;
use App\Cuenta;
use App\DetalleCuenta;
use App\Ruta;
use App\Vehiculo;
use App\Chauffeur;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrdenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cargas = Carga::orderBy('id','desc')
                                    ->paginate(10);
        return view('ordenes.index', compact('cargas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('ordenes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $products = collect($request->products)->transform(function($product) {
            $product['subtotal'] = $product['capacidad'] * $product['precio'];
            $product['total'] = ($product['subtotal'] - $product['anticipo']) - $product['comision'];
            return new Detalle($product);
        });
        if($products->isEmpty()) {
            return response()
            ->json([
                'products_empty' => ['Se requiere uno o más productos.']
            ], 422);
        }
        $data = $request->except('products');
        $data['user_id'] = Auth::user()->id;;
        $data['precio_envio'] = $products->sum('subtotal'); 
        $data['cant_llevadas'] = $products->sum('cantidad');
        $data['pago_transporte'] = $products->sum('total');
        $carga = Carga::create($data);
        $carga->products()->saveMany($products);

        //guardamos las cuentas por cobrar
        if ($carga->anticipo) {
            $deudacliente = $carga->precio_envio - $carga->anticipo;
                if ($carga->anticipo == $carga->precio_envio) {
                    $estado = Cuenta::FINALIZADO;
                }else {
                    $estado = Cuenta::VIGENTE;
                }
                $cuenta = new Cuenta;
                $cuenta->cuenta_id = $carga->id;
                $cuenta->cuenta_type = 'App\Carga';
                $cuenta->deuda = $deudacliente;
                $cuenta->estado = $estado;
                $cuenta->save();
                
                $det_cuenta = new DetalleCuenta;
                $det_cuenta->cuenta_id = $carga->id;
                $det_cuenta->abonado =$carga->anticipo;
                $det_cuenta->save();
        } else {
            $deudacliente = $carga->precio_envio;
            $estado = Cuenta::VIGENTE;
            $cuenta = new Cuenta;
            $cuenta->cuenta_id = $carga->id;
            $cuenta->cuenta_type = "App\Carga";
            $cuenta->deuda = $deudacliente;
            $cuenta->estado = $estado;
            $cuenta->save();
        }
        
        return response()
            ->json([
                'created' => true,
                'id' => $carga->id
            ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $carga = Carga::with(['products','user','ruta','cliente'])->findOrFail($id);
        return view('ordenes.show', compact('carga'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function edit(Carga $carga)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Carga $carga)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Carga  $carga
     * @return \Illuminate\Http\Response
     */
    public function destroy(Carga $carga)
    {
        //
    }

    public function selectCliente(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $clientes = Cliente::where('razon_social', 'like', '%'. $filtro . '%')
                                        ->orWhere('documento', 'like', '%'. $filtro . '%')
                                        ->orWhere('email', 'like', '%'. $filtro . '%')
                                        ->select('id','razon_social','documento')
                                        ->orderBy('id', 'asc')->get();
        return ['clientes' => $clientes];
    }
    public function selectRuta(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $rutas = Ruta::where('origen', 'like', '%'. $filtro . '%')
                                        ->orWhere('destino', 'like', '%'. $filtro . '%')
                                        ->select('id','origen','destino')
                                        ->orderBy('id', 'asc')->get();
        return ['rutas' => $rutas];
    }

    public function selectVehicle(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $vehiculos = Vehiculo::where('placa', 'like', '%'. $filtro . '%')
                                        ->orWhere('modelo', 'like', '%'. $filtro . '%')
                                        ->orWhere('n_motor', 'like', '%'. $filtro . '%')
                                        ->orWhere('serie', 'like', '%'. $filtro . '%')
                                        ->select('id','placa','modelo','n_motor','serie','capacidad')
                                        ->orderBy('id', 'asc')->get();
        return ['vehiculos' => $vehiculos];
    }

    public function selectChofer(Request $request){
        //if (!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $choferes = Chauffeur::where('nombres', 'like', '%'. $filtro . '%')
                                        ->orWhere('apellidos', 'like', '%'. $filtro . '%')
                                        ->orWhere('ci', 'like', '%'. $filtro . '%')
                                        ->select('id','nombres','apellidos','ci')
                                        ->orderBy('id', 'asc')->get();
        return ['choferes' => $choferes];
    }
}
