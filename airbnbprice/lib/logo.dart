import 'dart:async';
import 'package:flutter/material.dart';
import 'package:airbnbprice/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'AirBnb Price Detector',)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 300, 30, 90), // Add padding of 16 pixels around the child widget
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0), // Add a border radius of 10 pixels
    child: Image.asset('assets/airbnbLogo2.PNG'),
      ),
    ));
  }
}
