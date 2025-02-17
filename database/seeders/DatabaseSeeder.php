<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Product;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        $this->createUsers();
        $this->createProducts();
    }


    private function createProducts()
    {
        $products = [
            [
                'name' => 'Product 1',
                'price' => 1000,
                'discount' => 0
            ],
            [
                'name' => 'Product 2',
                'price' => 2000,
                'discount' => 20
            ],
            [
                'name' => 'Product 3',
                'price' => 3000,
                'discount' => 5
            ],
            [
                'name' => 'Product 4',
                'price' => 4000,
                'discount' => 0
            ],
        ];

        foreach ($products as $product) {
            Product::create([
                'name' => $product['name'],
                'price' => $product['price'],
                'discount' => $product['discount']
            ]);
        }
    }

    private function createUsers()
    {
        $users = [
            [
                'name' => 'User 1',
                'parent_id' => 0
            ],
            [
                'name' => 'User 2',
                'parent_id' => 1
            ],
            [
                'name' => 'User 3',
                'parent_id' => 2
            ],
            [
                'name' => 'User 4',
                'parent_id' => 3
            ],
        ];

        foreach ($users as $user) {
            $email = $user['name'] . '@example.com';
            User::create([
                'name' => $user['name'],
                'email' => $email,
                'parent_id' => $user['parent_id'],
                'password' => Hash::make($email)
            ]);
        }
    }
}
