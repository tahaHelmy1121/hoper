import 'dart:convert';

List<ProductsModel> productsModelRouteFromMap(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

class ProductsModel {
 var id;
 var residentialcommercial;
 var payed;
 var regionId;
 var region;
 var space;
 var referenceNumber;
 var producttypeId;
 var producttype;
 var receivedDate;
 var increasevalue;
 var termsDelivery;
 var giftsRewards;
 var giftsRewardstext;
 var price;
 var discount;
 var quantity;
 var manufactureId;
 var manufacture;
 var  manufactureImage;
 var categoryId;
 var categoryName;
 var sellerId;
 var sellerName;
 var sellerImage;
 var sellerAddress;
 var sellerPhone;
 var sellerInfo;
 var image;
 var  map;
 var name;
 var describe;
 var bigDescribe;
 var address;
 var isFavourite;
 var favouriteId;
  List<Attributes>? attributes;
  List<Null>? filters;
  List<Null>? relates;
 var reviews;
  List<Images>? images;

  ProductsModel(
      {this.id,
        this.residentialcommercial,
        this.payed,
        this.regionId,
        this.region,
        this.space,
        this.referenceNumber,
        this.producttypeId,
        this.producttype,
        this.receivedDate,
        this.increasevalue,
        this.termsDelivery,
        this.giftsRewards,
        this.giftsRewardstext,
        this.price,
        this.discount,
        this.quantity,
        this.manufactureId,
        this.manufacture,
        this.manufactureImage,
        this.categoryId,
        this.categoryName,
        this.sellerId,
        this.sellerName,
        this.sellerImage,
        this.sellerAddress,
        this.sellerPhone,
        this.sellerInfo,
        this.image,
        this.map,
        this.name,
        this.describe,
        this.bigDescribe,
        this.address,
        this.isFavourite,
        this.favouriteId,
        this.attributes,
        this.filters,
        this.relates,
        this.reviews,
        this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    residentialcommercial = json['residentialcommercial'];
    payed = json['payed'];
    regionId = json['region_id'];
    region = json['region'];
    space = json['space'];
    referenceNumber = json['reference_number'];
    producttypeId = json['producttype_id'];
    producttype = json['producttype'];
    receivedDate = json['received_date'];
    increasevalue = json['increasevalue'];
    termsDelivery = json['terms_delivery'];
    giftsRewards = json['gifts_rewards'];
    giftsRewardstext = json['gifts_rewardstext'];
    price = json['price'];
    discount = json['discount'];
    quantity = json['quantity'];
    manufactureId = json['manufacture_id'];
    manufacture = json['manufacture'];
    manufactureImage = json['manufacture_image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    sellerId = json['seller_id'];
    sellerName = json['seller_name'];
    sellerImage = json['seller_image'];
    sellerAddress = json['seller_address'];
    sellerPhone = json['seller_phone'];
    sellerInfo = json['seller_info'];
    image = json['image'];
    map = json['map'];
    name = json['name'];
    describe = json['describe'];
    bigDescribe = json['big_describe'];
    address = json['address'];
    isFavourite = json['is_favourite'];
    favouriteId = json['favourite_id'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
    if (json['filters'] != null) {
      filters = <Null>[];
      // json['filters'].forEach((v) {
      //   filters!.add(new Null.fromJson(v));
      // });
    }
    if (json['relates'] != null) {
      relates = <Null>[];
      // json['relates'].forEach((v) {
      //   relates!.add( Null.fromJson(v));
      // });
    }
    reviews = json['reviews'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['residentialcommercial'] = this.residentialcommercial;
    data['payed'] = this.payed;
    data['region_id'] = this.regionId;
    data['region'] = this.region;
    data['space'] = this.space;
    data['reference_number'] = this.referenceNumber;
    data['producttype_id'] = this.producttypeId;
    data['producttype'] = this.producttype;
    data['received_date'] = this.receivedDate;
    data['increasevalue'] = this.increasevalue;
    data['terms_delivery'] = this.termsDelivery;
    data['gifts_rewards'] = this.giftsRewards;
    data['gifts_rewardstext'] = this.giftsRewardstext;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['manufacture_id'] = this.manufactureId;
    data['manufacture'] = this.manufacture;
    data['manufacture_image'] = this.manufactureImage;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['seller_id'] = this.sellerId;
    data['seller_name'] = this.sellerName;
    data['seller_image'] = this.sellerImage;
    data['seller_address'] = this.sellerAddress;
    data['seller_phone'] = this.sellerPhone;
    data['seller_info'] = this.sellerInfo;
    data['image'] = this.image;
    data['map'] = this.map;
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['big_describe'] = this.bigDescribe;
    data['address'] = this.address;
    data['is_favourite'] = this.isFavourite;
    data['favourite_id'] = this.favouriteId;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    // if (this.filters != null) {
    //   data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    // }
    // if (this.relates != null) {
    //   data['relates'] = this.relates!.map((v) => v.toJson()).toList();
    // }
    data['reviews'] = this.reviews;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  var svgimage;
 var image;
 var title;
  var values;

  Attributes({this.svgimage, this.image, this.title, this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    svgimage = json['svgimage'];
    image = json['image'];
    title = json['title'];
    values = json['values'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['svgimage'] = this.svgimage;
    data['image'] = this.image;
    data['title'] = this.title;
    data['values'] = this.values;
    return data;
  }
}

class Images {
  var id;
var image;
var productId;

  Images({this.id, this.image, this.productId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_id'] = this.productId;
    return data;
  }
}