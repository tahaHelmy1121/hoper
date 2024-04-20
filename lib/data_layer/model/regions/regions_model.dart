import 'dart:convert';

List<RegionsModel> regionsModelRouteFromMap(String str) =>
    List<RegionsModel>.from(
        json.decode(str).map((x) => RegionsModel.fromJson(x)));

class RegionsModel {
 var id;
var name;
 var image;
 var countryId;
 var shippingPrice;
 var status;

  RegionsModel(
      {this.id,
      this.name,
      this.image,
      this.countryId,
      this.shippingPrice,
      this.status});

  RegionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    countryId = json['country_id'];
    shippingPrice = json['shipping_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['country_id'] = this.countryId;
    data['shipping_price'] = this.shippingPrice;
    data['status'] = this.status;
    return data;
  }
}
