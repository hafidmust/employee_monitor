import 'package:employee_monitor/models/user.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  // final token = Get.find<FlutterSecureStorage>();
  var data = ResponseData().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<bool> deleteToken() async {
    try {
      // await token.delete(key: 'token');
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
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


  Future<void> fetchUser() async {
    try {
      // final getToken = await token.read(key: 'token');
      final token =await getToken();
      final response = await ApiServices().getProfile(token);
      print(response);
      if(response.responseData != null){
        data.value = response.responseData!;
      }
    } catch (e) {
      print(e);
    }
  }
}
