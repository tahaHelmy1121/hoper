import 'dart:convert';

CustomerAddFavoriteModel AddfavodelFromMap(String str) => CustomerAddFavoriteModel.fromJson(json.decode(str));

class CustomerAddFavoriteModel {
  int? status;
  String? reason;
  int? types;
  String? title;
  int? customerfavourite;

  CustomerAddFavoriteModel(
      {this.status,
        this.reason,
        this.types,
        this.title,
        this.customerfavourite});

  CustomerAddFavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    types = json['types'];
    title = json['title'];
    customerfavourite = json['customerfavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['types'] = this.types;
    data['title'] = this.title;
    data['customerfavourite'] = this.customerfavourite;
    return data;
  }
}