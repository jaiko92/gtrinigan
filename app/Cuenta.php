<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Cuenta extends Model
{
    const VIGENTE = 'vigente';
    const FINALIZADO = 'finalizado';
    
    public static $estados = [self::VIGENTE, self::FINALIZADO];

    protected $fillable = [
        'carga_id','deuda','estado'
    ];

    public function cargas()
    {
        return $this->morphedByMany(Carga::class, 'cuenta');
    }

    /**
     * Get all of the videos that are assigned this tag.
     */
    public function detalles()
    {
        return $this->morphedByMany(Detalle::class, 'cuenta');
    }
}
