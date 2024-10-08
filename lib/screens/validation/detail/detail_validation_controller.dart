import 'dart:async';

import 'package:employee_monitor/models/detail_validation.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class DetailValidationController extends GetxController {
  var isLoading = false.obs;
  var dataValidation = ResponseData().obs;
  var message = ''.obs;
  var fileName = ''.obs;
  var role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getRoles();
  }
  Future<void>getRoles() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('role') != null) {
      role.value = prefs.getString('role')!;
    } else {
      role.value = '';
    }
  }
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      return prefs.getString('token')!;
    } else {
      return '';
    }
  }
  void fetchValidation(String id) async {
    try {
      isLoading(true);
      final token = await getToken();	
      final response = await ApiServices().getDetailValidation(token,id);
      print("response from controller : ${response.responseData}");
      fileName.value = response.responseData!.photoUrl!;
      dataValidation.value = response.responseData!;
    }catch(e){
      print('Error: $e');
    }finally{
      isLoading(false);
    }
  }

  Future<bool> updateAccValidation(String id) async {
    try {
      isLoading(true);
      final token = await getToken();	
      final response = await ApiServices().validationAccept(token, id);
      print("response from controller : ${response.message}");
      if (response.message == 'success') {
        print('success');
      }
      return true;
    }catch(e){
      print('Error: $e');
      return false;
    }finally{
      isLoading(false);
    }
  }

  Future<bool> updateRejectValidation(String id) async {
    try {
      isLoading(true);
      final token = await getToken();	
      final response = await ApiServices().validationReject(token, id);
      print("response from controller : ${response.message}");
      if (response.message == 'success') {
        print('success');
      }
      return true;
    }catch(e){
      print('Error: $e');
      return false;
    }finally{
      isLoading(false);
    }
  }

  String extractFileName() {
    return path.basename(fileName.value);
  }
  
}