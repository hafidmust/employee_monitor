import 'package:dio/dio.dart';
import 'package:employee_monitor/models/login.dart';
import 'package:employee_monitor/models/report.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Login> login(String username, String password) async {
    Login? dataLogin;
    try{
      await Future.delayed(Duration(seconds: 3));
      final response = await _dio.post('http://103.196.153.52/signin',data: {
        'username': username,
        'password': password
      });
      if(response.statusCode == 200){
        dataLogin = Login.fromJson(response.data);
        print(dataLogin.responseData!.token);
        return dataLogin;
      }else{
        throw Exception('Gagal login: ${response.statusCode}');
      }
    }catch(e){
      throw Exception('Gagal login: $e');
    }
  }

  Future<Report> getAllReport(String token) async {
    Report? dataReport;
    try{
      final respones = await _dio.get('http://103.196.153.52/api/v1/report/all',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token}'
        }));
      if(respones.statusCode == 200){
        print(respones.data);
        var data = respones.data;
        dataReport = Report.fromJson(data);
        return dataReport;
      }
      return Report.fromJson(respones.data);
    }catch(e){
      throw Exception('Get report failed : $e');
    }
  }
}
