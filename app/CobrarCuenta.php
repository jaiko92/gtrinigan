<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CobrarCuenta extends Model
{

     protected $fillable = ['carga_id', 'cliente_id', 'costo_carga','deuda','estado'];
    
    public function cargas(){

        return $this->hashmany();
    }
}
