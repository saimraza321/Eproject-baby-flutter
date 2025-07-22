import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDF5F9),
              Color(0xFFF4FDF7),
              Color(0xFFF6F3FF),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'images/logo.png',
            width: 180, 
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}