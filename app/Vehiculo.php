<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Vehiculo extends Model
{
    public function owner()
    {
        return $this->belongsTo(Owner::class);
    }

    public function detalles()
    {
        return $this->hasMany(Detalle::class);
    }
}
