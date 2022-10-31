import 'package:flutter/material.dart';
import 'package:selfintro/views/screens/git/GitScreen.dart';
import 'package:selfintro/views/screens/home/HomeScreen.dart';
import 'package:selfintro/views/screens/motive/MotiveScreen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child = HomeScreen();
    if (tabItem == "Page1")
      child = HomeScreen();
    else if (tabItem == "Page2")
      child = GitScreen();
    else if (tabItem == "Page3") child = MotiveScreen();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
