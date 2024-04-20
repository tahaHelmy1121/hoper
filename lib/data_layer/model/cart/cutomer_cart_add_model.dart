
import 'dart:convert';

CustomerCartAddModel addCartFrom(String str) =>
    CustomerCartAddModel.fromJson(json.decode(str));


class CustomerCartAddModel {
  int? status;
  String? reason;
  int? minQuantity;
  int? totalproduct;
  int? availableQuantity;
  int? totalCart;
  int? totalQuantity;

  CustomerCartAddModel(
      {this.status,
        this.reason,
        this.minQuantity,
        this.totalproduct,
        this.availableQuantity,
        this.totalCart,
        this.totalQuantity});

  CustomerCartAddModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    minQuantity = json['min_quantity'];
    totalproduct = json['totalproduct'];
    availableQuantity = json['available_quantity'];
    totalCart = json['total_cart'];
    totalQuantity = json['total_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['min_quantity'] = this.minQuantity;
    data['totalproduct'] = this.totalproduct;
    data['available_quantity'] = this.availableQuantity;
    data['total_cart'] = this.totalCart;
    data['total_quantity'] = this.totalQuantity;
    return data;
  }
}