import 'package:employee_monitor/models/dashboard_summary.dart';
import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  var listMenu = <MenuItem>[].obs;
  var dataSummary = ResponseDataDashboard().obs;
  var listReport = <ResponseData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchListMenu();
    fetchSummary();
  }

  Future<void> fetchListMenu() async {
    final SharedPreferences token = await SharedPreferences.getInstance();
    try {
      final getToken = token.getString('token');
      isLoading(true);
      final response = await ApiServices().getListMenu(getToken!);
      print("response ctrl : $response");

      print("response from controller : ${response.responseData}");

      listMenu.value = (response.responseData!)
          .map((item) => MenuItem.fromJson(item.toJson()))
          .toList();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
    Future<void> fetchSummary() async {
      final SharedPreferences token = await SharedPreferences.getInstance();
      try {
        final getToken = token.getString('token');
        isLoading(true);
        final response = await ApiServices().getDashboardSummary(getToken!);
        print("response ctrl : $response");

        print("response from controller : ${response.responseData}");

        dataSummary.value = response.responseData!;
      } catch (e) {
        print('Error: $e');
      } finally {
        isLoading(false);
      }
    }

    Future<void> fetchReportPerStatus(String status) async {
      final SharedPreferences token = await SharedPreferences.getInstance();
      try {
        final getToken = token.getString('token');
        isLoading(true);
        final response = await ApiServices().getReportPerStatus(getToken!, status);
        print("response ctrl : $response");

        print("response from controller : ${response.responseData}");

        listReport.value = response.responseData!;
      } catch (e) {
        print('Error: $e');
      } finally {
        isLoading(false);
      }
    }


  }


class MenuItem {
  final IconData icon;
  final String text;
  final Color color;
  final String route;

  MenuItem({
    required this.icon,
    required this.text,
    required this.color,
    required this.route,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      icon: getIconData(json['icon']),
      text: json['text'],
      color: getColor(json['color']),
      route: json['route'],
    );
  }

  static IconData getIconData(String iconName) {
    switch (iconName) {
      case 'note_add':
        return Icons.note_add;
      case 'add_task':
        return Icons.add_task;
      case 'format_list_bulleted':
        return Icons.format_list_bulleted;
      default:
        return Icons.error;
    }
  }

  static Color getColor(String colorName) {
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
