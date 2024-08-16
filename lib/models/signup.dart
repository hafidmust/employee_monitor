class Signup {
  String? message;
  ResponseData? responseData;

  Signup({this.message, this.responseData});

  Signup.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? fullName;
  String? username;
  String? password;
  String? role;
  String? position;
  String? nip;
  String? createdAt;
  String? updatedAt;

  ResponseData(
      {this.id,
      this.fullName,
      this.username,
      this.password,
      this.role,
      this.position,
      this.nip,
      this.createdAt,
      this.updatedAt});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    position = json['position'];
    nip = json['nip'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['position'] = this.position;
    data['nip'] = this.nip;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
