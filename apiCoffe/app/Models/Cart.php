<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Cart extends Model
{
    protected $fillable = [
        'id_cart',
        'id_food',
        'jumlah',
        'note',
    ];
    protected $table = 'cart'; // Assuming the table name is 'cart'
    protected $primaryKey = 'id_cart';
    public function food()
    {
        return $this->belongsTo(Makanan::class, 'id_food');
    }
}
