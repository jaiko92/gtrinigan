<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Carga extends Model
{
    protected $fillable = [
        'cliente_id', 'ruta_id', 'user_id',
        'cantidad_reses','cant_llevadas', 'precio_envio', 'anticipo',
        'pago_transporte', 'observacion'
    ];
    public function products()
    {
        return $this->hasMany(Detalle::class);
    }
    
    public function cuenta()
    {
        return $this->hasOne(Cuenta::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function ruta() {
        return $this->belongsTo(Ruta::class);
    }

    public function cliente() {
        return $this->belongsTo(Cliente::class);
    }

}
