<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Cliente extends Model
{
    public function cargas()
    {
        return $this->hasMany(Carga::class);
    }
}
