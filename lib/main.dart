import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/SplashScreen.dart';
import 'package:myapp/darazScreen.dart';
import 'package:myapp/dynamiclist.dart';
import 'package:myapp/first.dart';
import 'package:myapp/home.dart';
import 'package:myapp/product.dart';
import 'package:myapp/signup.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
      routes: {
        '/signup': (context) => Signup(),
        '/home': (context) => HomePage(),
        '/darazScreen': (context) => DarazScreen(),
        '/dynamiclist': (context) => Dynamiclist(),
        '/first': (context) => First(),
        '/product': (context) => product()

      },
    );
  }
}