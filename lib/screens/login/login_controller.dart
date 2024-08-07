import 'package:employee_monitor/models/login.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;
  var message = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<Login> login(String username, String password) async {
    try {
      isLoading(true);
      final response = await ApiServices().login(username, password);
      token.value = response.responseData!.token!;
      SecureStorage().write('token', token.value);
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