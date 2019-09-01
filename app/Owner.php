<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Owner extends Model
{
    public function getFullNameAttribute() {
        return ucfirst($this->nombre) . ' ' . ucfirst($this->apellidos);
    }

    public function vehiculo(){
        return $this->hasOne(Vehiculo::class);
    }
}
