class Report {
  String? message;
  List<ResponseData>? responseData;

  Report({this.message, this.responseData});

  Report.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? content;
  String? reportDate;
  String? photoUrl;
  User? user;

  ResponseData(
      {this.id,
      this.title,
      this.content,
      this.reportDate,
      this.photoUrl,
      this.user});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    reportDate = json['reportDate'];
    photoUrl = json['photoUrl'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['reportDate'] = this.reportDate;
    data['photoUrl'] = this.photoUrl;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? username;

  User({this.username});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
