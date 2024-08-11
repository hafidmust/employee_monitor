class Profile {
  String? message;
  ResponseData? responseData;

  Profile({this.message, this.responseData});

  Profile.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? username;
  String? role;
  String? createdAt;
  String? position;

  ResponseData(
      {this.fullName, this.username, this.role, this.createdAt, this.position});

  ResponseData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    username = json['username'];
    role = json['role'];
    createdAt = json['createdAt'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['username'] = this.username;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['position'] = this.position;
    return data;
  }
}
