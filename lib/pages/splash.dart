import 'dart:async';

import 'package:edify/pages/exports.dart';
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

    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
