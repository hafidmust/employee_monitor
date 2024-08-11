class ListMenu {
  String? message;
  List<ResponseData>? responseData;

  ListMenu({this.message, this.responseData});

  ListMenu.fromJson(Map<String, dynamic> json) {
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
  String? text;
  String? route;
  String? icon;
  String? color;
  List<String>? allowedRoles;
  String? createdAt;
  String? updatedAt;

  ResponseData(
      {this.id,
      this.text,
      this.route,
      this.icon,
      this.color,
      this.allowedRoles,
      this.createdAt,
      this.updatedAt});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    route = json['route'];
    icon = json['icon'];
    color = json['color'];
    allowedRoles = json['allowedRoles'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['route'] = this.route;
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['allowedRoles'] = this.allowedRoles;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
