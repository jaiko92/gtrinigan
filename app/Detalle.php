<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Detalle extends Model
{
    protected $fillable = [
        'carga_id', 'vehiculo_id', 'chofer_id', 'cantidad','observacion',
        'precio','subtotal','anticipo','comision','total'
    ];

    public function vehiculo()
    {
        return $this->belongsTo(Vehiculo::class);
    }
    public function chauffeur()
    {
        return $this->belongsTo(Chauffeur::class,'chofer_id');
    }
    public function carga()
    {
        return $this->belongsTo(Carga::class);
    }

}
