import 'dart:convert';

DeleteCartModel cartodelFromMap(String str) =>
    DeleteCartModel.fromJson(json.decode(str));

class DeleteCartModel {
  int? status;
  String? reason;
  int? totalCart;
  int? totalQuantity;

  DeleteCartModel({this.status, this.reason, this.totalCart, this.totalQuantity});

  DeleteCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    totalCart = json['total_cart'];
    totalQuantity = json['total_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['total_cart'] = this.totalCart;
    data['total_quantity'] = this.totalQuantity;
    return data;
  }
}