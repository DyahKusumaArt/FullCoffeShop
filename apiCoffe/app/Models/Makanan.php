<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Makanan extends Model
{
    protected $fillable = [
        'id_food',
        'nama_food',
        'deskripsi',
        'gambar',
        'harga',
        'jenis_fod',
        'fodOrDrink'
    ];
    protected $table = 'makanan'; // Assuming the table name is 'makanan'
    protected $primaryKey = 'id_food';
    public function carts()
    {
        return $this->hasMany(Cart::class, 'id_food');
    }
}
