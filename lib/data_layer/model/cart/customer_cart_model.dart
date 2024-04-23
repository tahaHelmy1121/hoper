import 'dart:convert';

CustomerCartModel cartodelFromMap(String str) =>
    CustomerCartModel.fromJson(json.decode(str));

class CustomerCartModel {
  List<Products>? products;
  int? totalCart;
  int? shippingCost;
  int? fullTotal;

  CustomerCartModel(
      {this.products, this.totalCart, this.shippingCost, this.fullTotal});

  CustomerCartModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    totalCart = json['total_cart'];
    shippingCost = json['shipping_cost'];
    fullTotal = json['full_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total_cart'] = this.totalCart;
    data['shipping_cost'] = this.shippingCost;
    data['full_total'] = this.fullTotal;
    return data;
  }
}

class Products {
  int? id;
  int? customerId;
  int? productId;
  String? productName;
  String? categoryName;
  String? productImage;
  String? address;
  String? receivedDate;
  String? describe;
  List<Null>? attributes;
  var price;
  int? buyingSucceeded;

  Products(
      {this.id,
      this.customerId,
      this.productId,
      this.productName,
      this.categoryName,
      this.productImage,
      this.address,
      this.receivedDate,
      this.describe,
      this.attributes,
      this.price,
      this.buyingSucceeded});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    categoryName = json['category_name'];
    productImage = json['product_image'];
    address = json['address'];
    receivedDate = json['received_date'];
    describe = json['describe'];
    // if (json['attributes'] != null) {
    //   attributes = <Null>[];
    //   json['attributes'].forEach((v) {
    //     attributes!.add(new Null.fromJson(v));
    // });

    price = json['price'];
    buyingSucceeded = json['buying_succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['category_name'] = this.categoryName;
    data['product_image'] = this.productImage;
    data['address'] = this.address;
    data['received_date'] = this.receivedDate;
    // data['describe'] = this.describe;
    // if (this.attributes != null) {
    //   data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    // }
    data['price'] = this.price;
    data['buying_succeeded'] = this.buyingSucceeded;
    return data;
  }
}
