<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
   
public function run()
{
    Product::create([
        'name' => 'Pink winter jacket',
        'image' => 'pink_jacket.png',
        'description' => 'Fluffy pink jacket for winter. Great comfort and warmth.',
        'original_price' => 220.00,
        'discounted_price' => 120.00,
    ]);

    Product::create([
        'name' => 'Blue Jumpsuit',
        'image' => 'blue_jumpsuit.png',
        'description' => 'Warm denim jumpsuit perfect for cold seasons.',
        'original_price' => 200.00,
        'discounted_price' => 100.00,
    ]);
    }
}
