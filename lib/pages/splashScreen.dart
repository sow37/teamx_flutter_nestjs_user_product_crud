import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

import 'package:teamx_client/pages/home.dart';


class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
    return const Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
            child: Text(
              'TEAMX',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 60, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white),
            )),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            'Designed by \nOusmane',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white),
          ),),
    );
  }
}