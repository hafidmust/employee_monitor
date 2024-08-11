import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final token = Get.find<FlutterSecureStorage>();
  var listMenu = <MenuItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchListMenu();
  }

  Future<bool>fetchListMenu() async {
    try {
      final getToken = await token.read(key: 'token');
      isLoading(true);
      final response = await ApiServices().getListMenu(getToken!);
      print("response ctrl : $response");
      
        print("response from controller : ${response.responseData}");
        
        listMenu.value = (response.responseData!).map((item)=> MenuItem.fromJson(
          item.toJson()
        )).toList();
        return true;
    } catch (e) {
      print('Error: $e');
      return false;
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