import 'dart:convert';

List<SupportAllMassageModel> CustomerSupportModelModelRouteFromMap(
        String str) =>
    List<SupportAllMassageModel>.from(
        json.decode(str).map((x) => SupportAllMassageModel.fromJson(x)));

class SupportAllMassageModel {
  var id;
  var customerId;
  var createDateTime;
  var message;
  var productid;
  var products;
  var names;
  var describe;
  var discountPrice;
  var isRead;
  var msgType;
  var type;

  SupportAllMassageModel(
      {this.id,
      this.customerId,
      this.createDateTime,
      this.message,
      this.productid,
      this.products,
      this.names,
      this.describe,
      this.discountPrice,
      this.isRead,
      this.msgType,
      this.type});

  SupportAllMassageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    createDateTime = json['create_date_time'];
    message = json['message'];
    productid = json['productid'];
    products = json['products'];
    names = json['names'];
    describe = json['describe'];
    discountPrice = json['discount_price'];
    isRead = json['is_read'];
    msgType = json['msg_type'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['create_date_time'] = this.createDateTime;
    data['message'] = this.message;
    data['productid'] = this.productid;
    data['products'] = this.products;
    data['names'] = this.names;
    data['describe'] = this.describe;
    data['discount_price'] = this.discountPrice;
    data['is_read'] = this.isRead;
    data['msg_type'] = this.msgType;
    data['type'] = this.type;
    return data;
  }
}
