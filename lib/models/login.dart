class Login {
  String? message;
  ResponseData? responseData;

  Login({this.message, this.responseData});

  Login.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? token;
  User? user;

  ResponseData({this.token, this.user});

  ResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? nip;
  String? position;
  String? username;
  String? password;
  String? role;

  User(
      {this.id,
      this.fullName,
      this.nip,
      this.position,
      this.username,
      this.password,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    nip = json['nip'];
    position = json['position'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['nip'] = this.nip;
    data['position'] = this.position;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}
