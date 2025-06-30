import 'package:eprojectbaby/firebase_options.dart';
import 'package:eprojectbaby/frontend/signup.dart';
import 'package:eprojectbaby/frontend/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- ADD THIS
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
  ),
      home: Splashscreen(),
      routes: {
        "/signup":(context)=> Signup(),
        // "/add":(context)=> (isLoggedIn && isAdmin) ? Addproduct(): Login(),
        // "/login":(context)=>Login(),
      },
      )
    );
}