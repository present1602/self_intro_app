import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selfintro/views/helper/helper.dart';
import 'package:selfintro/views/screens/git/GitScreen.dart';
import 'package:selfintro/views/screens/motive/MotiveScreen.dart';
import 'package:selfintro/views/screens/career/CareerScreen.dart';
import 'package:selfintro/views/screens/home/HomeScreen.dart';
import 'package:selfintro/views/widget/CustomAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewController extends StatefulWidget {
  const ViewController({super.key});

  @override
  State<ViewController> createState() => _ViewControllerState();
}

void openGit() {
  print("open git");
}

class _ViewControllerState extends State<ViewController> {
  int _selectedIndex = 0;
  String pageTitle = "";

  final List<dynamic> _children = [
    HomeScreen(),
    GitScreen(),
    MotiveScreen(),
    CareerScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        pageTitle = "깃허브";
      }
      if (_selectedIndex == 2) {
        pageTitle = "지원동기";
      }
      if (_selectedIndex == 3) {
        pageTitle = "경력기술서";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? null
            : AppBar(
                centerTitle: true,
                title: Text(
                  pageTitle,
                  style: TextStyle(color: Colors.black),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigator.of(context, rootNavigator: true).pop(context);
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String email = Uri.encodeComponent("present1306@naver.com");
            Uri mail = Uri.parse("mailto:$email");
            // Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
            if (!await launchUrl(mail)) {
              String message = "메일 앱을 열 수 없습니다";
              CommonBasicDialog(context, message);
            }
          },
          child: const Icon(Icons.auto_fix_normal_outlined),
        ),
      ),
    );
  }
}
