class TaskAssigned {
  String? message;
  List<ResponseData>? responseData;

  TaskAssigned({this.message, this.responseData});

  TaskAssigned.fromJson(Map<String, dynamic> json) {
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

  AssignedBy({this.username});

  AssignedBy.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
