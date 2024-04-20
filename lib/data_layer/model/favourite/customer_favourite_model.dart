import 'dart:convert';

List<CustomerFavoriteModel> CustomerFavoriteModelModelRouteFromMap(String str) => List<CustomerFavoriteModel>.from(json.decode(str).map((x) => CustomerFavoriteModel.fromJson(x)));
class CustomerFavoriteModel {
  var id;
  var productId;
  var productName;
  var productDescribe;
  var quantity;
  var receivedDate;
  var address;
  var categoryName;
  var productImage;
  var price;
  var discount;
  List<void>? attributes;

  CustomerFavoriteModel(
      {this.id,
        this.productId,
        this.productName,
        this.productDescribe,
        this.quantity,
        this.receivedDate,
        this.address,
        this.categoryName,
        this.productImage,
        this.price,
        this.discount,
        this.attributes});

  CustomerFavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productDescribe = json['product_describe'];
    quantity = json['quantity'];
    receivedDate = json['received_date'];
    address = json['address'];
    categoryName = json['category_name'];
    productImage = json['product_image'];
    price = json['price'];
    discount = json['discount'];
    if (json['attributes'] != null) {
      attributes = <Null>[];
      // json['attributes'].forEach((v) {
      //   attributes!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_describe'] = this.productDescribe;
    data['quantity'] = this.quantity;
    data['received_date'] = this.receivedDate;
    data['address'] = this.address;
    data['category_name'] = this.categoryName;
    data['product_image'] = this.productImage;
    data['price'] = this.price;
    data['discount'] = this.discount;
    // if (this.attributes != null) {
    //   data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}