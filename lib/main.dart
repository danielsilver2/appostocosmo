import 'dart:async';
import 'package:appostocosmo/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Posto Cosmo",
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),
      () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff493163)
        ),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Image(
              fit: BoxFit.fill,
              image: Image.asset('icone/splash_icon.png')
              .image,
            ),
          ),
        ),
      ),
    );
  }
}
