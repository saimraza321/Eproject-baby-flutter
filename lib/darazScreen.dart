import 'package:flutter/material.dart';
import 'package:myapp/drawerside.dart';

class DarazScreen extends StatefulWidget {
  const DarazScreen({Key? key}) : super(key: key);

  @override
  _DarazScreenState createState() => _DarazScreenState();
}

class _DarazScreenState extends State<DarazScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daraz Screen',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      drawer: Drawerside(),
      body: Column(
        children: [
          // Banner
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Circular Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCircle('circle1.jpg'),
              buildCircle('circle2.jpg'),
              buildCircle('circle3.jpg'),
              buildCircle('circle4.jpg'),
            ],
          ),
          SizedBox(height: 10),

          // Cards Section - Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              childAspectRatio: 0.75,
              children: [
                buildProductCard(
                  image: 'product1.jpg',
                  title: 'Product 1',
                  price: 'Rs. 1200',
                ),
                buildProductCard(
                  image: 'product2.jpg',
                  title: 'Product 2',
                  price: 'Rs. 850',
                ),
                buildProductCard(
                  image: 'product3.jpg',
                  title: 'Product 3',
                  price: 'Rs. 1500',
                ),
                buildProductCard(
                  image: 'product4.jpg',
                  title: 'Product 4',
                  price: 'Rs. 950',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircle(String assetName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(assetName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildProductCard({required String image, required String title, required String price}) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(image, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: TextStyle(color: Colors.deepOrange)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Add to cart functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}
