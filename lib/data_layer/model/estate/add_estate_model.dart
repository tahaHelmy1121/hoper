import 'dart:convert';

AddAddressModel AddAddressModeldelFromMap(String str) =>
    AddAddressModel.fromJson(json.decode(str));

class AddAddressModel {
  int? status;
  String? reason;

  AddAddressModel({this.status, this.reason});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
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