import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  var isLoading = false.obs;
  var dataReport = List<ResponseData>.empty().obs;
  var message = ''.obs;
  final token = Get.find<FlutterSecureStorage>();

  @override
  void onInit() {
    fetchReport();
    super.onInit();
  }
  
  void fetchReport() async {
    try {
      isLoading(true);
      final getToken = await token.read(key: 'token');	
      final response = await ApiServices().getAllReport(getToken!);
      print("response from controller : ${response.responseData}");
      dataReport.value = response.responseData!;
    }catch(e){
      print('Error: $e');
    }finally{
      isLoading(false);
    }
  }
}