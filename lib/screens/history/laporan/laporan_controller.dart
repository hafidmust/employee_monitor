import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  var isLoading = false.obs;
  var dataReport = List<ResponseData>.empty().obs;
  var message = ''.obs;
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJoYWZpZG11c3QiLCJpYXQiOjE3MjI4NzQxODZ9.v-69QOPdaJMKr7IqJMRYYR-bmnEkjD3IbWTv7QLyYkQ';

  @override
  void onInit() {
    fetchReport();
    super.onInit();
  }
  
  void fetchReport() async {
    try {
      isLoading(true);
      final response = await ApiServices().getAllReport(token);
      print("response from controller : ${response.responseData}");
      dataReport.value = response.responseData!;
    }catch(e){
      print('Error: $e');
    }finally{
      isLoading(false);
    }
  }
}