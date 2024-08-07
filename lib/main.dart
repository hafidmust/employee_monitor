import 'package:employee_monitor/navigation/app_navigation.dart';
import 'package:employee_monitor/screens/add_laporan/add_laporan_screen.dart';
import 'package:employee_monitor/screens/add_tugas/add_tugas.dart';
import 'package:employee_monitor/screens/home/home_screen.dart';
import 'package:employee_monitor/screens/login/login_screen.dart';
import 'package:employee_monitor/screens/validation/detail/detail_validation.dart';
import 'package:employee_monitor/screens/validation/list/list_validation.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final readToken = SecureStorage().read('token');
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: readToken != null ? AppNavigation() : LoginScreen(),
      initialRoute: readToken != null ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => AppNavigation(),
        '/add_laporan': (context) => AddLaporanScreen(),
        '/add_tugas': (context) => AddTugasScreen(),
        '/detail_validation': (context) => DetailValidationScreen(),
        '/list_validation': (context) => ListValidationScreen(),
      },
    );
  }
}
