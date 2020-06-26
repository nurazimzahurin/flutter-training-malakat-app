import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset('images/login3.png'),
          )),
          Center(
            child: SpinKitChasingDots(
              color: Colors.greenAccent, 
              size: 50,)
          ),
        ],
      ),
    );
  }
}