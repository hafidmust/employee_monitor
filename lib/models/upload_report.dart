class UploadReport {
  String? message;
  ResponseData? responseData;

  UploadReport({this.message, this.responseData});

  UploadReport.fromJson(Map<String, dynamic> json) {
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

  ResponseData(
      {this.id,
      this.userId,
      this.title,
      this.content,
      this.reportDate,
      this.photoUrl,
      this.status,
      this.createdAt,
      this.updatedAt});

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
    return data;
  }
}
