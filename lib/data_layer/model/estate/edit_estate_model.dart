import 'dart:convert';

EditAddressModel EditAddressModeldelFromMap(String str) =>
    EditAddressModel.fromJson(json.decode(str));



class EditAddressModel {
  int? status;
  String? reason;

  EditAddressModel({this.status, this.reason});

  EditAddressModel.fromJson(Map<String, dynamic> json) {
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