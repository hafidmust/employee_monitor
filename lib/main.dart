import 'package:employee_monitor/navigation/app_navigation.dart';
import 'package:employee_monitor/screens/add_laporan/add_laporan_screen.dart';
import 'package:employee_monitor/screens/add_tugas/add_tugas.dart';
import 'package:employee_monitor/screens/home/home_screen.dart';
import 'package:employee_monitor/screens/login/login_screen.dart';
import 'package:employee_monitor/screens/register/register_screen.dart';
import 'package:employee_monitor/screens/validation/detail/detail_validation.dart';
import 'package:employee_monitor/screens/validation/list/list_validation.dart';
import 'package:employee_monitor/utils/dependency_injection.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // DependencyInjection.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // final readToken = SecureStorage().read('token');
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: '/login',
      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/home': (context) => AppNavigation(),
      //   '/add_laporan': (context) => AddLaporanScreen(),
      //   '/add_tugas': (context) => AddTugasScreen(),
      //   '/detail_validation': (context) => DetailValidationScreen(),
      //   '/list_validation': (context) => ListValidationScreen(),
      // },
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => AppNavigation()),
        GetPage(name: '/add_laporan', page: () => AddLaporanScreen()),
        GetPage(name: '/add_tugas', page: () => AddTugasScreen()),
        GetPage(name: '/detail_validation/:id', page: () => DetailValidationScreen()),
        GetPage(name: '/list_validation', page: () => ListValidationScreen()),
        GetPage(name: '/register', page: ()=> RegisterScreen())
      ],
      onInit: () async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        if(token != null){
          Get.offAllNamed('/home');
        }else{
          Get.offAllNamed('/login');
        }
      },
    );
  }
}
