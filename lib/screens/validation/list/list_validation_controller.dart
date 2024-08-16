import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListValidationController extends GetxController {
  var isLoading = false.obs;
  var dataReport = List<ResponseData>.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchReport();
  }  
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      return prefs.getString('token')!;
    } else {
      return '';
    }
  }
  void fetchReport() async {
    try {
      isLoading(true);
      final token = await getToken();	
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