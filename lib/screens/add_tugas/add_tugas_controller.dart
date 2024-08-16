
import 'package:employee_monitor/models/list_staff.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTugasController extends GetxController {
  var isLoading = false.obs;
  var dataStaff = <ResponseData>[].obs;
  var isSuccessful = false.obs;
  


  
  @override
  void onInit() {
    super.onInit();
    fetchStaff();
  }

  void fetchStaff() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final getToken = await pref.getString('token');	
      isLoading(true);
      final response = await ApiServices().getListStaff(getToken!);
      print("response from controller : ${response.responseData}");
      if (response.responseData != null) {
        dataStaff.value = response.responseData!;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
   
  }

  Future<bool> addTask(int id, String desc, String deadline) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      isLoading(true);
      // if (selectedStaff.value == null) {
      //   Get.snackbar('Failed', 'Please select a staff');
      //   return;
      // }
      final getToken = await pref.getString('token');
      final response = await ApiServices().createTask(getToken!, id, desc, deadline);
      print(response.message);
      if (response.message == 'success') {
        isLoading(false);
        isSuccessful(true);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isLoading(false);
    }
  }

  // void setSelectedStaff(ResponseData staff) {
  //   selectedStaff.value = staff;
  // }
  
}