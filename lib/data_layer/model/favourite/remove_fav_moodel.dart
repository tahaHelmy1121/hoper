
import 'dart:convert';

RemoveFavModel RemovefavodelFromMap(String str) => RemoveFavModel.fromJson(json.decode(str));

class RemoveFavModel {
  var status;
  var reason;

  RemoveFavModel({this.status, this.reason});

  RemoveFavModel.fromJson(Map<String, dynamic> json) {
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