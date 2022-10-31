import 'package:flutter/material.dart';
import 'package:selfintro/views/controller/ViewController.dart';
import 'package:selfintro/views/screens/career/CareerScreen.dart';
import 'package:selfintro/views/screens/general/main_splash.dart';
import 'package:selfintro/views/screens/git/GitScreen.dart';
import 'package:selfintro/views/screens/home/HomeScreen.dart';
import 'package:selfintro/views/screens/motive/MotiveScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '자기소개 앱',
      theme: ThemeData(
          primarySwatch: Colors.red,
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24),
            headline2: TextStyle(fontSize: 22),
            headline3: TextStyle(fontSize: 20),
            headline4: TextStyle(fontSize: 18),
          )),
      home: MainSplashScreen(),
      // home: ViewController(),
      // initialRoute: "/home",
      // routes: {
      //   "/home": (context) => ViewController(),
      //   "/git": (context) => GitScreen(),
      //   "/motive": (context) => MotiveScreen(),
      //   "/career": (context) => CareerScreen(),
      // },
    );
  }
}

// initialRoute: "/",
//   routes: {
//     "/": (context) => HomeScreen(),
//     "/git": (context) => GitScreen(),
//   },