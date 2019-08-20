<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class DetalleCuenta extends Model
{
    protected $table = 'detalle_cuentas';
    protected $fillable = [
        'cuenta_id','abonado'
    ];
}
