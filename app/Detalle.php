<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Detalle extends Model
{
    protected $fillable = [
        'carga_id', 'vehiculo_id', 'chofer_id', 'cantidad','observacion',
        'precio','subtotal','anticipo','comision','total'
    ];
    public function invoice()
    {
        return $this->belongsTo(Carga::class);
    }

    public function cuentas()
    {
        return $this->morphMany(Cuenta::class, 'cuenta');
    }
}
