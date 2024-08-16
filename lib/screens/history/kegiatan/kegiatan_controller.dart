
import 'package:employee_monitor/models/task_assigned.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KegiatanController extends GetxController {
  var isLoading = false.obs;
  var listTaskAssigned = <ResponseData>[].obs;
  

  
  @override
  void onInit() {
    super.onInit();
    fetchTaskAssigned();
  }

  Future<bool> fetchTaskAssigned() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final token = pref.getString('token');
      isLoading(true);
      final response = await ApiServices().getTaskAssigned(token!);
      print("response from controller : ${response.responseData}");
      if (response.responseData != null) {
        listTaskAssigned.value = response.responseData!;
      }
      return true;
    }catch(e){
      print("Error: $e");
      return false;
    }
    finally {
      isLoading(false);
    }
  }
  
}