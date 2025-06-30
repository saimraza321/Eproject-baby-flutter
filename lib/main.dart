import 'package:eprojectbaby/firebase_options.dart';
import 'package:eprojectbaby/frontend/signup.dart';
import 'package:eprojectbaby/frontend/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- ADD THIS
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
      routes: {
        "/signup":(context)=> Signup(),
        // "/add":(context)=> (isLoggedIn && isAdmin) ? Addproduct(): Login(),
        // "/login":(context)=>Login(),
      },
      )
    );
}