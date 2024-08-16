class DetailValidation {
  String? message;
  ResponseData? responseData;

  DetailValidation({this.message, this.responseData});

  DetailValidation.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? title;
  String? content;
  String? reportDate;
  String? photoUrl;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  ResponseData(
      {this.id,
      this.userId,
      this.title,
      this.content,
      this.reportDate,
      this.photoUrl,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    reportDate = json['reportDate'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['reportDate'] = this.reportDate;
    data['photoUrl'] = this.photoUrl;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? username;
  String? fullName;

  User({this.username, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    return data;
  }
}
