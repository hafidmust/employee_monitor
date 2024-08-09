
import 'package:employee_monitor/models/task_assigned.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class KegiatanController extends GetxController {
  var isLoading = false.obs;
  var listTaskAssigned = <ResponseData>[].obs;
  final token = Get.find<FlutterSecureStorage>();

  
  @override
  void onInit() {
    super.onInit();
    fetchTaskAssigned();
  }

  Future<bool> fetchTaskAssigned() async {
    try {
      final getToken = await token.read(key: 'token');
      isLoading(true);
      final response = await ApiServices().getTaskAssigned(getToken!);
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