import 'package:flutter/material.dart';
import 'package:selfintro/views/screens/career/CareerScreen.dart';
import 'package:selfintro/views/screens/git/GitScreen.dart';
import 'package:selfintro/views/screens/home/HomeScreen.dart';
import 'package:selfintro/views/screens/motive/MotiveScreen.dart';

enum TabItem { home, git, motive, career }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.git: 'git',
  TabItem.motive: 'motive',
  TabItem.career: 'career',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.home: Colors.red,
  TabItem.git: Colors.green,
  TabItem.motive: Colors.blue,
  TabItem.career: Colors.purple,
};

const Map<TabItem, int> tabIdx = {
  TabItem.home: 0,
  TabItem.git: 1,
  TabItem.motive: 2,
  TabItem.career: 3,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.home: const HomeScreen(),
  TabItem.git: const GitScreen(),
  TabItem.motive: const MotiveScreen(),
  TabItem.career: const CareerScreen(),
};
