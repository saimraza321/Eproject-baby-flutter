import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  final String image;
  final String title;
  final double price;
  final double originalPrice;
  final String description;

  ProductDetailPage({
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.description,
  });

  Future<void> addToCart(BuildContext context) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/cart");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'user_id': 1, // fixed for now
        'product_id': productId,
        'quantity': 1,
      }),
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      if (res['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ ${res['message']}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('⚠️ Failed to add to cart')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Server error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(color: Colors.black),
        actions: [
          IconButton(icon: Icon(Icons.share, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main Image
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    image,
                    height: 500,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Row(
                    children: [
                      thumbnail(image),
                      SizedBox(width: 6),
                      thumbnail(image),
                      SizedBox(width: 6),
                      Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("+3", style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Title
            Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                Spacer(),
                Text("[+info]", style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 8),

            // Price
            Row(
              children: [
                Text("\$$price", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(width: 10),
                Text(
                  "\$$originalPrice",
                  style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                ),
                SizedBox(width: 8),
                Text("50% off", style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(description, style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),

            Spacer(),

            // Buttons
            Row(
              children: [
                // Add to Wishlist
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Add to wishlist",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF9C43F0),
                      side: BorderSide(color: Color(0xFF9C43F0)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Add to Cart
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF9C43F0), Color(0xFF722BFB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () => addToCart(context),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget thumbnail(String img) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
