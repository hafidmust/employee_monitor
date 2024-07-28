import 'package:employee_monitor/navigation/app_navigation.dart';
import 'package:employee_monitor/screens/add_laporan/add_laporan_screen.dart';
import 'package:employee_monitor/screens/home/home_screen.dart';
import 'package:employee_monitor/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => AppNavigation(),
        '/add_laporan': (context) => AddLaporanScreen(),
      },
    );
  }
}
