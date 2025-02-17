<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Revenue extends Model
{
    const LIST_REVENUE = [
        10, 5, 3
    ];

    protected $fillable = [
        'user_id',
        'transaction_id',
        'percent',
        'price'
    ];

    protected static function booted()
    {
        static::creating(function ($model) {
            if ($model->user) {
                $model->user->revenue += $model->price;
                $model->user->save();
            }
        });
    }


    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
