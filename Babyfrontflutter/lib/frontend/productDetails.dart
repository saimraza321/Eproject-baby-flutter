import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({ Key? key }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top App Bar with Back Button and Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, size: 20),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Product details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // Single Cart Item
              buildCartItem(
                imageUrl:
                    'https://up.yimg.com/ib/th/id/OIP.m07MNLs46FuZp2C3cUFpUAAAAA?pid=Api&rs=1&c=1&qlt=95&w=88&h=117',
                title: 'Classy chex shirt',
                colorAndSize: 'Bright pink  |  9M - 12M',
                trackingId: 'IWH345891',
                price: '\$120.00',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartItem({
    required String imageUrl,
    required String title,
    required String colorAndSize,
    required String trackingId,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF4ECEE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade300,
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              SizedBox(width: 12),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(colorAndSize, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 2),
                    Text(
                      "Tracking id : $trackingId",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        text: "Total : ",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                            text: price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 207, 253),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {
                // Navigate to product details
              },
              child: Text(
                "View Product details",
                style: TextStyle(
                  color: Color(0xFFA75DF0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}