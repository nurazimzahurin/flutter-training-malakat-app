import 'package:flutter/material.dart';
import 'package:flutter_training/screens/home.dart';
import 'package:flutter_training/screens/login.dart';
import 'package:flutter_training/screens/profile.dart';
import 'package:flutter_training/screens/register.dart';
import 'package:flutter_training/screens/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => Login(),
        '/register': (BuildContext context) => Register(),
        '/home': (BuildContext context) => Home(),
        '/profile': (BuildContext context) => Profile(),
      },
    );
  }
}
