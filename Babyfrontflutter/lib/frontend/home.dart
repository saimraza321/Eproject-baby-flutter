import 'package:flutter/material.dart';
import 'product_detail_page.dart'; // Make sure this file exists

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.menu),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Shop for", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text("Liverce 5 yr", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_none_outlined),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Banner PageView Slider
              Container(
                height: 160,
                child: PageView(
                  controller: _pageController,
                  children: [
                    bannerSlide('images/Banner.png'),
                    bannerSlide('images/banner.jpg'),
                    bannerSlide('images/Banner.png'),
                  ],
                ),
              ),

              SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == 0 ? const Color(0xFF9C43F0) : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Shop by category
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Shop by category',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Category Product Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductCard(
                      imageUrl: 'images/pink_jacket.png',
                      productName: 'Pink winter jacket',
                      originalPrice: 220.00,
                      discountedPrice: 120.00,
                      description: 'Fluffy pink jacket for winter. Great comfort and warmth.',
                    ),
                    SizedBox(width: 10),
                    ProductCard(
                      imageUrl: 'images/blue_jumpsuit.png',
                      productName: 'Blue Jumpsuit',
                      originalPrice: 200.00,
                      discountedPrice: 100.00,
                      description: 'Warm denim jumpsuit perfect for cold seasons.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Trending items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Trending items',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("See all"),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Trending Product Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductCard(
                      imageUrl: 'images/pink_jacket.png',
                      productName: 'Pink winter jacket',
                      originalPrice: 220.00,
                      discountedPrice: 120.00,
                      description: 'Fluffy pink jacket for winter. Great comfort and warmth.',
                    ),
                    SizedBox(width: 10),
                    ProductCard(
                      imageUrl: 'images/blue_jumpsuit.png',
                      productName: 'Blue Jumpsuit',
                      originalPrice: 200.00,
                      discountedPrice: 100.00,
                      description: 'Warm denim jumpsuit perfect for cold seasons.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerSlide(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double originalPrice;
  final double discountedPrice;
  final String description;

  const ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              title: productName,
              image: imageUrl,
              price: discountedPrice,
              originalPrice: originalPrice,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imageUrl, height: 120, fit: BoxFit.cover, width: double.infinity),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text("50% off", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Multiple sizes available", style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 4),
            Row(
              children: [
                Text('\$$discountedPrice', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text('\$$originalPrice',
                    style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
