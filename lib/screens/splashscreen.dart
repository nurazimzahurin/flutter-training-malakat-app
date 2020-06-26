import 'package:flutter/material.dart';
import 'package:flutter_training/services/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    getAuthUser();
  }

  getAuthUser() async {
    var user = await AuthService().currentUser();
    await Future.delayed(Duration(seconds: 1));
    if(user != null){
      Navigator.of(context).pushReplacementNamed('/home');
    }else{
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Container(
          child: Image.asset('images/login3.png'),
        ),
      ),
    ),
    );
  }
}