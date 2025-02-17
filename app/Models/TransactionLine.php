<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TransactionLine extends Model
{
    protected $fillable = [
        'transaction_id',
        'product_id',
        'quantity',
        'price'
    ];
}
