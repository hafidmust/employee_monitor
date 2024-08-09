class CreateTask {
  String? message;
  ResponseData? responseData;

  CreateTask({this.message, this.responseData});

  CreateTask.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? dueDate;
  AssignedBy? assignedBy;
  AssignedBy? assignedTo;

  ResponseData(
      {this.id,
      this.description,
      this.dueDate,
      this.assignedBy,
      this.assignedTo});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    dueDate = json['dueDate'];
    assignedBy = json['assignedBy'] != null
        ? new AssignedBy.fromJson(json['assignedBy'])
        : null;
    assignedTo = json['assignedTo'] != null
        ? new AssignedBy.fromJson(json['assignedTo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['dueDate'] = this.dueDate;
    if (this.assignedBy != null) {
      data['assignedBy'] = this.assignedBy!.toJson();
    }
    if (this.assignedTo != null) {
      data['assignedTo'] = this.assignedTo!.toJson();
    }
    return data;
  }
}

class AssignedBy {
  String? username;
  String? fullName;

  AssignedBy({this.username, this.fullName});

  AssignedBy.fromJson(Map<String, dynamic> json) {
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
