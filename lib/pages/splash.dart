import 'dart:async';

import 'package:edify/Theme.dart';
import 'package:edify/pages/exports.dart';
import 'package:edify/services/export.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash() : super();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      if (user != null) {
        await getUserDetails();

        String dateToday = date();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/splash.jpg')),
      ),
    );
  }
}
