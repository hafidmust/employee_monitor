import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init(){
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
  }
}