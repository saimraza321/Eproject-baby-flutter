import 'package:device_preview/device_preview.dart';
import 'package:eprojectbaby/frontend/cancelled.dart';
import 'package:eprojectbaby/frontend/delivered.dart';
import 'package:eprojectbaby/frontend/home.dart';
import 'package:eprojectbaby/frontend/onboarding.dart';
import 'package:eprojectbaby/frontend/processing.dart';
import 'package:eprojectbaby/frontend/product_detail_page.dart';
import 'package:eprojectbaby/frontend/signin_screen.dart';
import 'package:eprojectbaby/frontend/signup_screen.dart';
import 'package:eprojectbaby/frontend/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eprojectbaby/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.dark,
      ),
      home: Splashscreen(),
      routes: {
        "/onboarding": (context) => OnboardingScreen(),
        '/login': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/processing': (context) => const Processing(),
        '/delivered': (context) => const Delivered(),
        '/canceled': (context) => const Cancelled(),
        // '/productdetail': (context) =>  ProductDetailPage(image: '', title: '', price: , originalPrice: null, description: '',),
        '/home': (context) =>  HomePage(),
      },
    );
  }
}
