import 'package:flutter/material.dart';

import 'projects.dart';
import 'reports_screen.dart';
import 'settings.dart';

final pages = [
  const Center(child: ProjectsPage()),
  //Center(child: OfflineModePage()),
  const Center(child: ReportsPage()),
  const Center(child: SettingsPage()),
];
BottomNavigationBar bottomNavBar(int currentIndex) {
  return BottomNavigationBar(
      currentIndex: currentIndex,
      iconSize: 30,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.lightBlueAccent,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          // backgroundColor: Colors.orange
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: 'Reports',
          // backgroundColor: Colors.blueAccent
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          // backgroundColor: Colors.blue
        ),
      ],
      onTap: (index) {
        currentIndex = index;

        // if (index == 1) {
        //   appSettings.isAppOfflineMode = true;
        // } else {
        //   appSettings.isAppOfflineMode = false;
        // }
      });
}
