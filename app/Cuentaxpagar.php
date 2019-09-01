<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Cuentaxpagar extends Model
{
    protected $table = 'cuentaxpagar';
    const VIGENTE = 'vigente';
    const FINALIZADO = 'finalizado';
    
    public static $estados = [self::VIGENTE, self::FINALIZADO];

    protected $fillable = [ 'carga_id','deuda','estado'];
   
    public function detalle()
    {
        return $this->belongsTo(Detalle::class);
    }
    public function detalles()
    {
        return $this->hasMany(Detallecuentaxpagar::class,'cuenta_id');
    }
}
