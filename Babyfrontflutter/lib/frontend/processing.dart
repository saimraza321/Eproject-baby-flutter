import 'package:flutter/material.dart';

class Processing extends StatefulWidget {
  const Processing({Key? key}) : super(key: key);

  @override
  _ProcessingState createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing> {
  int selectedIndex = 0;

  final List<String> tabs = ['Processing', 'Delivered', 'Canceled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75), // Top margin for tabs
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4ECEE),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // Cart Items Below Tabs
            SizedBox(height: 25),
            buildCartItem(
              imageUrl:
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=150&q=80',
              title: 'Nike Sneakers',
              colorAndSize: 'Red  |  Size 40',
              trackingId: 'IWH345891',
              price: '\$120.00',
            ),
            buildCartItem(
              imageUrl:
                  "https://up.yimg.com/ib/th/id/OIP.johRj4ZhziWlMPaooxBmKwHaHa?pid=Api&rs=1&c=1&qlt=95&w=121&h=121",
              title: 'Yellow shirt',
              colorAndSize: 'Bright yellow  |  9M - 12M',
              trackingId: 'IWH345892',
              price: '\$120.25',
            ),
          ],
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
              // Left: Image
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
              // Right: Details
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
                // TODO: Navigate to detail page
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
