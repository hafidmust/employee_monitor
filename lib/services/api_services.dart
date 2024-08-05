import 'package:dio/dio.dart';
import 'package:employee_monitor/models/login.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Login> login(String username, String password) async {
    Login? dataLogin;
    try{
      await Future.delayed(Duration(seconds: 3));
      final response = await _dio.post('http://10.0.2.2:5000/signin',data: {
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
}
