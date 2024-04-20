import 'dart:convert';

NewSupportAllMassageModel NewSupportodelFromMap(String str) =>
    NewSupportAllMassageModel.fromJson(json.decode(str));

class NewSupportAllMassageModel {
  int? status;
  String? reason;

  NewSupportAllMassageModel({this.status, this.reason});

  NewSupportAllMassageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    return data;
  }
}