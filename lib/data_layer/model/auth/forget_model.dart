class ForgetModel {
  int? status;
  String? reason;
  int? customerId;
  String? msg;

  ForgetModel({this.status, this.reason, this.customerId, this.msg});

  ForgetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    customerId = json['customer_id'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['customer_id'] = this.customerId;
    data['msg'] = this.msg;
    return data;
  }
}