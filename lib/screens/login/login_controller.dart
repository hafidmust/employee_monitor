import 'package:employee_monitor/models/login.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;
  var message = ''.obs;
  final saveToken = Get.find<FlutterSecureStorage>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<Login> login(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoading(true);
      final response = await ApiServices().login(username, password);
      token.value = response.responseData!.token!;
      prefs.setString("token", response.responseData!.token!);
      // await saveToken.write(key: 'token', value: token.value);
      return response;
    } catch (e) {
      print("from controller: $e");
      message.value = "Login gagal, silahkan periksa kembali username dan password";
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}