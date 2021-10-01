import 'dart:async';
import 'package:appostocosmo/services/firebase_messaging.dart';
import 'package:appostocosmo/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

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
    FirebaseMessagingService();

    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff663399)),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Image(
              fit: BoxFit.fill,
              image: Image.asset('icone/splash_icon.png').image,
            ),
          ),
        ),
      ),
    );
  }
}
