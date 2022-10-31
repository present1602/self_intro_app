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

import 'BottomNavigation.dart';
import 'TabItem.dart';
import 'TabNavigation.dart';

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
  var _currentTab = TabItem.home;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.git: GlobalKey<NavigatorState>(),
    TabItem.motive: GlobalKey<NavigatorState>(),
    TabItem.career: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      /// 네비게이션 탭을 누르면, 해당 네비의 첫 스크린으로 이동!
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  // void _onTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if (_selectedIndex == 1) {
  //       pageTitle = "깃허브";
  //     }
  //     if (_selectedIndex == 2) {
  //       pageTitle = "지원동기";
  //     }
  //     if (_selectedIndex == 3) {
  //       pageTitle = "경력기술서";
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

        if (isFirstRouteInCurrentTab) {
          // 메인 화면이 아닌 경우
          if (_currentTab != TabItem.home) {
            // 메인 화면으로 이동
            _selectTab(TabItem.home);
            // 앱 종료 방지
            return false;
          }
        }

        /// 네비게이션 바의 첫번째 스크린인 경우, 앱 종료
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.git),
            _buildOffstageNavigator(TabItem.motive),
            _buildOffstageNavigator(TabItem.career),
          ],
        ),
        bottomNavigationBar:
            BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            OpenEmail(context);
          },
          child: const Icon(Icons.auto_fix_normal_outlined),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    /// (offstage == false) -> 트리에서 완전히 제거된다.
    return Offstage(
        offstage: _currentTab != tabItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        ));
  }
}
