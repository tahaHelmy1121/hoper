import 'dart:convert';
List<OrdersModel> orderModelRouteFromMap(String str) =>
    List<OrdersModel>.from(
        json.decode(str).map((x) => OrdersModel.fromJson(x)));


class OrdersModel {
  var id;
  var customerId;
  var orderTotal;
  var shippingCost;
  var fullTotal;
  var createDateTime;
  var orderStatus;
  var paymentMethod;
  var fileName;
  var productId;
  var productname;
  var productimg;
  var space;
  var referenceNumber;
  var address;
  var sellerName;
  var sellerImage;
  var sellerPhone;
var region;
  var agree;

  OrdersModel(
      {this.id,
        this.customerId,
        this.orderTotal,
        this.shippingCost,
        this.fullTotal,
        this.createDateTime,
        this.orderStatus,
        this.paymentMethod,
        this.fileName,
        this.productId,
        this.productname,
        this.productimg,
        this.space,
        this.referenceNumber,
        this.address,
        this.sellerName,
        this.sellerImage,
        this.sellerPhone,
        this.region,
        this.agree});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    orderTotal = json['order_total'];
    shippingCost = json['shipping_cost'];
    fullTotal = json['full_total'];
    createDateTime = json['create_date_time'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    fileName = json['file_name'];
    productId = json['product_id'];
    productname = json['productname'];
    productimg = json['productimg'];
    space = json['space'];
    referenceNumber = json['reference_number'];
    address = json['address'];
    sellerName = json['seller_name'];
    sellerImage = json['seller_image'];
    sellerPhone = json['seller_phone'];
    region = json['region'];
    agree = json['agree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['order_total'] = this.orderTotal;
    data['shipping_cost'] = this.shippingCost;
    data['full_total'] = this.fullTotal;
    data['create_date_time'] = this.createDateTime;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['file_name'] = this.fileName;
    data['product_id'] = this.productId;
    data['productname'] = this.productname;
    data['productimg'] = this.productimg;
    data['space'] = this.space;
    data['reference_number'] = this.referenceNumber;
    data['address'] = this.address;
    data['seller_name'] = this.sellerName;
    data['seller_image'] = this.sellerImage;
    data['seller_phone'] = this.sellerPhone;
    data['region'] = this.region;
    data['agree'] = this.agree;
    return data;
  }
}