import 'package:flutter/material.dart';
import 'processing.dart';
import 'delivered.dart';

class Cancelled extends StatelessWidget {
  const Cancelled({Key? key}) : super(key: key);

  final List<String> tabs = const ['Processing', 'Delivered', 'Canceled'];

  // Custom slide transition (Left to Right)
  void navigateWithSlideLeft(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Slide from left
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.easeInOut),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4ECEE),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          navigateWithSlideLeft(context, const Processing());
                        } else if (index == 1) {
                          navigateWithSlideLeft(context, const Delivered());
                        }
                        // index == 2 is current page
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            const SizedBox(height: 25),
            buildCartItem(
              imageUrl: 'https://m.media-amazon.com/images/I/61q2Q0xHlAL._AC_UL1000_.jpg',
              title: 'Baby shoes',
              colorAndSize: 'Blue  |  Size 3',
              price: '\$80.00',
              cancelDate: '7 July 2025',
            ),
            buildCartItem(
              imageUrl: "https://tse2.mm.bing.net/th/id/OIP.jpCoLB8tcoa9kDJ7QRKQ0wHaJD?pid=Api&P=0&h=220",
              title: 'Coastal romper',
              colorAndSize: 'Sky blue  |  61CM - 68CM',
              price: '\$100.25',
              cancelDate: '4 July 2025',
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
    required String price,
    required String cancelDate,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECEE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
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
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(colorAndSize, style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        text: "Total : ",
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Cancelled on: $cancelDate",
                      style: const TextStyle(
                        color: Color(0xFFF14142),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                  color: const Color(0xFFF1E9FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "View Product details",
                style: TextStyle(
                 color: Color(0xFF8D4EF3),
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
