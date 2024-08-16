import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:employee_monitor/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLaporanController extends GetxController {
  
  final isLoading = false.obs;
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  var imageURL = '';
  Future pickImage(ImageSource source) async {
    try{
      final XFile? image = await ImagePicker().pickImage(source: source,imageQuality: 50,
        maxHeight: 680,
        maxWidth: 680);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      selectedImage.value = image;
    }catch(e){
      print(e);
    }
  }
  Future<bool> addLaporan(String title, String content, String reportDate ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoading(true);
      if (selectedImage.value == null) {
        Get.snackbar('Failed', 'Please select an image');
        return false;
      }
      var formData = dio.FormData.fromMap({
        'title': title,
        'content': content,
        'reportDate': reportDate,
        'photo':  await dio.MultipartFile.fromFile(selectedImage.value!.path, filename:selectedImage.value!.path.split('/').last),
      });
      final getToken = prefs.getString('token');
      final response = await ApiServices().addReport(getToken!, formData);
      print(response.message);
      if (response.message == 'success'){
        isLoading(false);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }finally{
      isLoading(false);
    }
  }
  void removeImage(){
    selectedImage.value = null;
  }
}
