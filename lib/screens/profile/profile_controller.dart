import 'package:employee_monitor/models/user.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final token = Get.find<FlutterSecureStorage>();
  var data = ResponseData().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<bool> deleteToken() async {
    try {
      await token.delete(key: 'token');
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<void> fetchUser() async {
    try {
      final getToken = await token.read(key: 'token');
      final response = await ApiServices().getProfile(getToken!);
      print(response);
      if(response.responseData != null){
        data.value = response.responseData!;
      }
    } catch (e) {
      print(e);
    }
  }
}
