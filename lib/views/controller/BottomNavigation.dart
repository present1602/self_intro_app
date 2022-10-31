import 'package:flutter/material.dart';

import 'NavBarItems.dart';
import 'TabItem.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.home),
        _buildItem(TabItem.git),
        _buildItem(TabItem.motive),
        _buildItem(TabItem.career),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Colors.amber,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return navBarItems[tabIdx[tabItem]!];
  }
}
