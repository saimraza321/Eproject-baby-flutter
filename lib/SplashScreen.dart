
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget { 
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.deepOrange,
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.flutter_dash, size: 100,color: const Color.fromARGB(255, 255, 255, 255)),
          SizedBox(height: 20),
          Text(
            'WELCOME TO FLUTTER',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          )
        ],
      ),
     ),
      
    );
  }
}