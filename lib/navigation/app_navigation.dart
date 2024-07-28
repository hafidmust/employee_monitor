import 'package:employee_monitor/screens/history/history_screen.dart';
import 'package:employee_monitor/screens/home/home_screen.dart';
import 'package:employee_monitor/screens/profile/profile_screen.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        selectedItemColor: CustomColor.red,  
        currentIndex: _currentIndex,
        onTap: (index)=>{
          setState(()=>{
            _currentIndex = index
          })
        },
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home'), selectedColor: CustomColor.red),
          SalomonBottomBarItem(icon: Icon(Icons.history), title: Text('History'), selectedColor: CustomColor.red),
          SalomonBottomBarItem(icon: Icon(Icons.account_circle), title: Text('Profile'), selectedColor: CustomColor.red),
        ],
      ),
    );
  }
}