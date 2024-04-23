import 'dart:convert';

List<PaymentModel> paymentModelRouteFromMap(String str) =>
    List<PaymentModel>.from(
        json.decode(str).map((x) => PaymentModel.fromJson(x)));

class PaymentModel {
  var id;
  var name;
  var describe;
  var image;

  PaymentModel({this.id, this.name, this.describe, this.image});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    describe = json['describe'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['image'] = this.image;
    return data;
  }
}
