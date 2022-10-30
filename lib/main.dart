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
        primarySwatch: Colors.blue,
      ),
      home: const ViewController(),
    );
  }
}
