import 'package:dio/dio.dart';
import 'package:employee_monitor/models/create_task.dart';
import 'package:employee_monitor/models/list_menu.dart';
import 'package:employee_monitor/models/list_staff.dart';
import 'package:employee_monitor/models/login.dart';
import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/models/task_assigned.dart';
import 'package:employee_monitor/models/upload_report.dart';
import 'package:employee_monitor/models/user.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
        // connectTimeout: Duration(seconds: 10),
        // receiveTimeout: Duration(seconds: 10),
        // sendTimeout: Duration(seconds: 10),
        ),
  );
  // final String BASE_URL = 'http://103.196.153.52';
  final String BASE_URL = 'http://10.0.2.2:8080';

  Future<Login> login(String username, String password) async {
    Login? dataLogin;
    try {
      await Future.delayed(Duration(seconds: 3));
      final response = await _dio.post(BASE_URL + '/signin',
          data: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        dataLogin = Login.fromJson(response.data);
        print(dataLogin.responseData!.token);
        return dataLogin;
      } else {
        throw Exception('Gagal login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal login: $e');
    }
  }

  Future<Report> getAllReport(String token) async {
    Report? dataReport;
    try {
      final respones = await _dio.get('${BASE_URL}/api/v1/report/all',
          options: Options(
              headers: {'Authorization': 'Bearer ${token}'},
              receiveDataWhenStatusError: true));
      if (respones.statusCode == 201) {
        print(respones.data);
        var data = respones.data;
        dataReport = Report.fromJson(data);
        return dataReport;
      }
      return Report.fromJson(respones.data);
    } catch (e) {
      throw Exception('Get report failed : $e');
    }
  }

  Future<UploadReport> addReport(String token, FormData formData) async {
    try {
      final response = await _dio.post(
        '$BASE_URL/api/v1/report',
        data: formData,
        onSendProgress: (int sent, int total) {
          print('$sent $total');
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        }),
      );
      return UploadReport.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Add report failed: $e');
    }
  }

  static Future<dynamic> uploadReport(filePath) async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJoYWZpZG11c3QiLCJpYXQiOjE3MjI5NjI0ODF9.yZleGd7HCTLVdVRH9JwQoj_pBa_ZXQBD-smREbFfwUw';
    try {
      FormData formData = new FormData.fromMap({
        'title': 'title',
        'content': 'content',
        'reportDate': DateTime.now(),
        'photo': await MultipartFile.fromFile(filePath,
            filename: filePath.split('/').last),
      });
      Response<UploadReport> response =
          await Dio().post('http://10.0.2.2/api/v1/report',
              data: formData,
              options: Options(headers: <String, String>{
                'Authorization': 'Bearer $token',
              }));
      return response;
    } on DioException catch (e) {
      return e.response;
    } catch (e) {
      return e;
    }
  }

  Future<TaskAssigned> getTaskAssigned(String token) async {
    TaskAssigned? dataTaskAssigned;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/task/assigned',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        dataTaskAssigned = TaskAssigned.fromJson(response.data);
        return dataTaskAssigned;
      } else {
        throw Exception('Gagal get task assigned: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get task assigned failed: $e');
    }
  }

  Future<ListStaff> getListStaff(String token) async {
    ListStaff? dataStaff;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/user/staff',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        dataStaff = ListStaff.fromJson(response.data);
        return dataStaff;
      } else {
        throw Exception('Gagal get list staff: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get list staff failed: $e');
    }
  }

  Future<CreateTask> createTask(
      String token, int? assignedTo, String desc, String date) async {
    CreateTask? dataCreateTask;
    try {
      final response = await _dio.post('$BASE_URL/api/v1/task',
          data: {
            'assignedToId': assignedTo,
            'description': desc,
            'dueDate': date,
          },
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 201) {
        dataCreateTask = CreateTask.fromJson(response.data);
        return dataCreateTask;
      } else {
        throw Exception('Gagal create task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Create task failed: $e');
    }
  }

  Future<ListMenu> getListMenu(String token) async {
    ListMenu? dataMenu;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/listMenu',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        dataMenu = ListMenu.fromJson(response.data);
        return dataMenu;
      } else {
        throw Exception('Gagal get list menu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get list menu failed: $e');
    }
  }

  Future<Profile> getProfile(String token) async {
    Profile? profile;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/user',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        profile = Profile.fromJson(response.data);
        return profile;
      } else {
        throw Exception('Gagal get profile: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get profile failed: $e');
    }
  }
}
