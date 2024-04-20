import 'dart:convert';

List<SlidersModel> sliderModelRouteFromMap(String str) => List<SlidersModel>.from(json.decode(str).map((x) => SlidersModel.fromJson(x)));
class SlidersModel {
  int? id;
 var image;
  int? categoryId;
  String? name;
  String? name1;
  String? describe;
  String? link;
  String? categoryName;
  int? subcategoryId;
var subcategoryName;
  List<void>? slidersImages1;
  List<void>? slidersImages2;

  SlidersModel({this.id,
    this.image,
    this.categoryId,
    this.name,
    this.name1,
    this.describe,
    this.link,
    this.categoryName,
    this.subcategoryId,
    this.subcategoryName,
    this.slidersImages1,
    this.slidersImages2});

  SlidersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['category_id'];
    name = json['name'];
    name1 = json['name1'];
    describe = json['describe'];
    link = json['link'];
    categoryName = json['category_name'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    // if (json['sliders_images1'] != null) {
    //   slidersImages1 = <Null>[];
    //   json['sliders_images1'].forEach((v) {
    //     slidersImages1!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['sliders_images2'] != null) {
    //   slidersImages2 = <Null>[];
    //   json['sliders_images2'].forEach((v) {
    //     slidersImages2!.add(new Null.fromJson(v));
    //   });
    // }
  }
}