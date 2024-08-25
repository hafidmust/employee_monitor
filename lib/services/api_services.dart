import 'package:dio/dio.dart';
import 'package:employee_monitor/models/create_task.dart';
import 'package:employee_monitor/models/dashboard_summary.dart';
import 'package:employee_monitor/models/detail_validation.dart';
import 'package:employee_monitor/models/list_menu.dart';
import 'package:employee_monitor/models/list_staff.dart';
import 'package:employee_monitor/models/login.dart';
import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/models/signup.dart';
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

  Future<Signup> signup(String fullName,String nip, String username, String password, String jabatan) async {
    Signup? dataSignup;
    try {
      final response = await _dio.post(BASE_URL + '/signup',
          data: {
            'fullName': fullName,
            'nip': nip,
            'username': username, 
            'password': password, 
            'jabatan': jabatan});
      if (response.statusCode == 201) {
        dataSignup = Signup.fromJson(response.data);
        return dataSignup;
      } else {
        throw Exception('Gagal signup: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal signup: $e');
    }
  }

  Future<Report> getAllReport(String token) async {
    Report? dataReport;
    try {
      final respones = await _dio.get('${BASE_URL}/api/v1/report/all',
          options: Options(
              headers: {'Authorization': 'Bearer ${token}'},
              receiveDataWhenStatusError: true));
      if (respones.statusCode == 200) {
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

  Future<Report> getAllReportMe(String token) async {
    Report? dataReport;
    try {
      final respones = await _dio.get('${BASE_URL}/api/v1/report/me',
          options: Options(
              headers: {'Authorization': 'Bearer ${token}'},
              receiveDataWhenStatusError: true));
      if (respones.statusCode == 200) {
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
    }on DioException catch (e) {
      
      throw Exception(e.response!.data['error']);
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

  Future<DetailValidation> getDetailValidation(String token, String id) async {
    DetailValidation? detailValidation;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/report/$id',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        detailValidation = DetailValidation.fromJson(response.data);
        return detailValidation;
      } else {
        throw Exception('Gagal get detail validation: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get detail validation failed: $e');
    }
  }
  Future<DetailValidation> validationAccept(String token, String id) async {
    DetailValidation? detailValidation;
    try {
      final response = await _dio.put('$BASE_URL/api/v1/report/$id/acc',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        detailValidation = DetailValidation.fromJson(response.data);
        return detailValidation;
      } else {
        throw Exception('Gagal get update acc validation: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get detail validation failed: $e');
    }
  }
  Future<DetailValidation> validationReject(String token, String id) async {
    DetailValidation? detailValidation;
    try {
      final response = await _dio.put('$BASE_URL/api/v1/report/$id/reject',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        detailValidation = DetailValidation.fromJson(response.data);
        return detailValidation;
      } else {
        throw Exception('Gagal put reject validation: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get detail validation failed: $e');
    }
  }
  Future<DashboardSummary> getDashboardSummary(String token) async {
    DashboardSummary? dashboardSummary;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/reports/summary',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        dashboardSummary = DashboardSummary.fromJson(response.data);
        return dashboardSummary;
      } else {
        throw Exception('Gagal get dashboard summary: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get dashboard summary failed: $e');
    }
  }

  Future<Report> getReportPerStatus(String token, String status) async {
    Report? dataReport;
    try {
      final response = await _dio.get('$BASE_URL/api/v1/reports/$status',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      if (response.statusCode == 200) {
        dataReport = Report.fromJson(response.data);
        return dataReport;
      } else {
        throw Exception('Gagal get report per status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Get report per status failed: $e');
    }
  }
}
