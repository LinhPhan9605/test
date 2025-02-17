<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\TransactionLine;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Product;
use App\Models\Revenue;

class BaseController extends Controller
{
    const REVENUE_LV1 = 10;
    const REVENUE_LV2 = 5;
    const REVENUE_LV3 = 3;

    public function login(Request $request)
    {
        if (auth('user')->check()) {
            auth('user')->logout();
        }

        $rules = [
            'email' => 'required|min:6|max:50',
            'password' => 'required|min:6|max:50',
        ];

        $params = request()->only('password', 'email');

        $validation = Validator::make($params, $rules);

        if ($validation->fails()) {
            return $this->failure('False', 400, $validation->messages());
        }

        $credentials = [
            'email' => $params['email'],
            'password' => $params['password']
        ];

        $remember = request()->has('remember');

        if (auth('user')->attempt($credentials, $remember)) {
            return $this->success(auth('user'));
        }

        return $this->failure('False');
    }

    public function products()
    {
        $products = Product::get()
            ->map(function ($item) {
                $price = (int) ($item->price - ($item->price / 100 * $item->discount));
                return [
                    'image' => 'https://fastly.picsum.photos/id/84/200/200.jpg?hmac=6H-uafgNQmg74KSd7tSKVP1PWLigkAnXdB_PyFgxXNA',
                    'price' => $price,
                    'id' => $item->id,
                    'name' => $item->name,
                ];
            });

        return $this->success($products);
    }

    public function checkout(Request $request)
    {
        if (!auth('user')->check()) {
            return $this->failure('fail_login');
        }

        $transaction = Transaction::create([
            'user_id' => auth('user')->id(),
            'total_price' => 0
        ]);

        $totalPrice = 0;

        foreach ($request->products as $product) {
            $currenProduct = Product::find($product['id']);

            if ($currenProduct) {
                $price = (int) ($currenProduct->price - ($currenProduct->price / 100 * $currenProduct->discount));
                $totalPrice += $price * $product['quantity'];
                TransactionLine::create([
                    'transaction_id' => $transaction->id,
                    'product_id' => $currenProduct->id,
                    'quantity' => $product['quantity'],
                    'price' => $price,
                ]);
            }
        }

        $transaction->total_price = $totalPrice;
        $transaction->save();

        $this->revenueForUser($transaction);

        return $this->success($transaction);
    }

    public function profile()
    {
        if (!auth('user')->check()) {
            return $this->failure('fail_login');
        }

        return $this->success(User::find(auth('user')->id()));
    }

    public function getChildren($id)
    {
        $user = User::with('childrenWithChildren')->findOrFail($id);

        $children = $this->getAllChildren($user);

        $data = collect($children)->map(function ($item) {
            return [
                'id' => $item['id'],
                'name' => $item['name'],
                'revenue' => $item['revenue']
            ];
        });

        return $this->success($data);
    }

    public function getRevenues()
    {
        $users = User::get()
            ->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'revenue' => $user->revenue
                ];
            });

        return $this->success($users);
    }

    private function revenueForUser($transaction)
    {
        $user = User::with([
            'parent',
            'parent.parent',
            'parent.parent.parent',
        ])->find($transaction->user_id);

        $this->addRevenue($user, $transaction);
    }

    private function addRevenue($user, $transaction, $level = 1)
    {
        if ($user->parent && $level <= count(Revenue::LIST_REVENUE)) {
            Revenue::create([
                'user_id' => $user->parent->id,
                'transaction_id' => $transaction->id,
                'percent' => Revenue::LIST_REVENUE[$level - 1],
                'price' => (int) ($transaction->total_price / 100 * Revenue::LIST_REVENUE[$level - 1])
            ]);

            if ($user->parent->parent) {
                $level += 1;
                $this->addRevenue($user->parent, $transaction, $level);
            }
        }
    }

    private function getAllChildren($user, $children = [])
    {
        if ($user->childrenWithChildren->count() > 0) {
            $children = array_merge($children, $user->childrenWithChildren->toArray());

            foreach ($user->childrenWithChildren as $currentChildren) {
                $children = $this->getAllChildren($currentChildren, $children);
            }

            return $children;
        } else {
            return $children;
        }
    }

    protected function success($data = [], $message = 'OK', $status = 200)
    {
        return response()->json([
            'success' => true,
            'data' => $data,
            'message' => $message,
        ], $status);
    }

    protected function failure($message, $status = 400, $errors = null)
    {
        $status = $status === 'error_account_not_logged_in' ? 401 : $status;
        return response()->json([
            'success' => false,
            'message' => $message,
            'errors' => $errors,
        ], $status);
    }
}
