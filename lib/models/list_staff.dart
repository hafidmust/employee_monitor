class ListStaff {
  String? message;
  List<ResponseData>? responseData;

  ListStaff({this.message, this.responseData});

  ListStaff.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['responseData'] != null) {
      responseData = <ResponseData>[];
      json['responseData'].forEach((v) {
        responseData!.add(new ResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  int? id;
  String? fullName;
  String? username;
  String? role;
  String? createdAt;

  ResponseData(
      {this.id, this.fullName, this.username, this.role, this.createdAt});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    username = json['username'];
    role = json['role'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['username'] = this.username;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
