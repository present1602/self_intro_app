import 'package:flutter/material.dart';
import 'package:selfintro/views/controller/ViewController.dart';

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
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24),
            headline2: TextStyle(fontSize: 22),
            headline3: TextStyle(fontSize: 20),
            headline4: TextStyle(fontSize: 18),
          )),
      home: const ViewController(),
    );
  }
}

// initialRoute: "/",
//   routes: {
//     "/": (context) => HomeScreen(),
//     "/git": (context) => GitScreen(),
//   },