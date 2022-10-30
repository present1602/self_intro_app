import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selfintro/views/screens/git/GitScreen.dart';
import 'package:selfintro/views/screens/motive/MotiveScreen.dart';
import 'package:selfintro/views/screens/career/CareerScreen.dart';
import 'package:selfintro/views/screens/home/HomeScreen.dart';

class ViewController extends StatefulWidget {
  const ViewController({super.key});

  @override
  State<ViewController> createState() => _ViewControllerState();
}

void openGit() {
  print("open git");
}

class _ViewControllerState extends State<ViewController> {
  int _currentIndex = 0;
  final List<dynamic> _children = [
    HomeScreen(),
    GitScreen(),
    CareerScreen(),
    MotiveScreen()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '깃허브',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '지원동기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: '경력기술서',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }
}
