import 'dart:async';

import 'package:flutter/material.dart';
import 'package:selfintro/views/controller/ViewController.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  final isAuth = true;

  late Timer _timer;

  _MainSplashScreenState() {
    _timer = Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => ViewController()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/main_splash.png', fit: BoxFit.cover);
  }
}
