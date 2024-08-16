class DashboardSummary {
  String? message;
  ResponseDataDashboard? responseData;

  DashboardSummary({this.message, this.responseData});

  DashboardSummary.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseData = json['responseData'] != null
        ? new ResponseDataDashboard.fromJson(json['responseData'])
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

class ResponseDataDashboard {
  int? pENDING;
  int? aCCEPTED;
  int? rEJECTED;

  ResponseDataDashboard({this.pENDING, this.aCCEPTED, this.rEJECTED});

  ResponseDataDashboard.fromJson(Map<String, dynamic> json) {
    pENDING = json['PENDING'];
    aCCEPTED = json['ACCEPTED'];
    rEJECTED = json['REJECTED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PENDING'] = this.pENDING;
    data['ACCEPTED'] = this.aCCEPTED;
    data['REJECTED'] = this.rEJECTED;
    return data;
  }
}
