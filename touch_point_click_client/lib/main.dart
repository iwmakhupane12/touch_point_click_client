import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/screens/splashScreen.dart';

void main() {
  runApp(MyClientApp());
}

class MyClientApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPClick Client',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
