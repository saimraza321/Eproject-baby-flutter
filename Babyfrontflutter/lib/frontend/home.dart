import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class Product {
  final int id; // <-- ADD THIS
  final String name;
  final String image;
  final String description;
  final double originalPrice;
  final double discountedPrice;

  Product({
    required this.id, // <-- ADD THIS
    required this.name,
    required this.image,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // <-- ADD THIS
      name: json['name'],
      image: json['image'],
      description: json['description'],
      originalPrice: double.parse(json['original_price'].toString()),
      discountedPrice: double.parse(json['discounted_price'].toString()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/products"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List products = data['products'];
      setState(() {
        _allProducts = products.map((json) => Product.fromJson(json)).toList();
        _filteredProducts = _allProducts;
      });
    } else {
      throw Exception("Failed to load products");
    }
  }

  void _filterProducts(String query) {
    setState(() {
      _searchQuery = query;
      _filteredProducts =
          _allProducts.where((product) {
            final name = product.name.toLowerCase();
            final desc = product.description.toLowerCase();
            final search = query.toLowerCase();
            return name.contains(search) || desc.contains(search);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(Icons.menu),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Shop for",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Liverce 5 yr",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_none_outlined),
                  ],
                ),
              ),

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
                          onChanged: _filterProducts,
                          decoration: InputDecoration(
                            hintText: 'Search by name or description',
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
                    3,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            index == 0
                                ? const Color(0xFF9C43F0)
                                : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Shop by category',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              _filteredProducts.isEmpty
                  ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          _filteredProducts.map((product) {
                            return ProductCard(
                              productId: product.id,
                              imageUrl:
                                  "http://127.0.0.1:8000/images/${product.image}",
                              productName: product.name,
                              originalPrice: product.originalPrice,
                              discountedPrice: product.discountedPrice,
                              description: product.description,
                            );
                          }).toList(),
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
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int productId; // <-- ADD THIS
  final String imageUrl;
  final String productName;
  final double originalPrice;
  final double discountedPrice;
  final String description;

  const ProductCard({
    required this.productId, // <-- ADD THIS
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
            builder:
                (_) => ProductDetailPage(
                  productId: productId, // ✅ Now this works!
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
                  child: Image.network(
                    imageUrl,
                    height: 120,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
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
                    child: Text(
                      "50% off",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
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
            Text(
              "Multiple sizes available",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$$discountedPrice',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  '\$$originalPrice',
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
