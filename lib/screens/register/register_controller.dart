import 'package:employee_monitor/models/signup.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
  var successRegister = false.obs;
  var isLoading = false.obs;
  Future<Signup> register(String fullName,String nip, String username, String jabatan, String password) async {
    try {
      isLoading(true);
      final response = await ApiServices().signup(fullName, nip, username, password, jabatan);
      print("response from controller : ${response.responseData}");

      // token.value = response.responseData!.token!;
      // prefs.setString("token", response.responseData!.token!);
      // await saveToken.write(key: 'token', value: token.value);
      successRegister(true);
      return response;
    } catch (e) {
      successRegister(false);
      print("from controller: $e");
      // message.value = "Login gagal, silahkan periksa kembali username dan password";
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}