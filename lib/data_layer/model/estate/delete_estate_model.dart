import 'dart:convert';

DeleteAddressModel AddressodelFromMap(String str) =>
    DeleteAddressModel.fromJson(json.decode(str));


class DeleteAddressModel {
  int? status;
  String? reason;

  DeleteAddressModel({this.status, this.reason});

  DeleteAddressModel.fromJson(Map<String, dynamic> json) {
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