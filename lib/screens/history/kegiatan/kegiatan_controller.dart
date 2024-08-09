
import 'package:employee_monitor/models/list_staff.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/secure_storage.dart';
import 'package:get/get.dart';

class KegiatanController extends GetxController {
  var isLoading = false.obs;
  var dataKegiatan = List<ResponseData>.empty().obs;
  
}