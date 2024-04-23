import 'dart:convert';

List<CategoriesModel> categoryModelRouteFromMap(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));
class CategoriesModel {
  var id;
  var parentId;
  var attributeGroups;
  var filters;
  var isTop;
  var isColumn;
  var sortOrder;
  var status;
  var lastAdd;
  var image;
  var imageHome;
  var imageHomeNotUrl;
  var name;
  var describe;
  var metaTitle;
  var metaTagsDescribe;
  var metaTagsKeywords;
  var count;
  List<Null>? child;
  var catchild;

  CategoriesModel(
      {this.id,
        this.parentId,
        this.attributeGroups,
        this.filters,
        this.isTop,
        this.isColumn,
        this.sortOrder,
        this.status,
        this.lastAdd,
        this.image,
        this.imageHome,
        this.imageHomeNotUrl,
        this.name,
        this.describe,
        this.metaTitle,
        this.metaTagsDescribe,
        this.metaTagsKeywords,
        this.count,
        this.child,
        this.catchild});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    attributeGroups = json['attribute_groups'];
    filters = json['filters'];
    isTop = json['is_top'];
    isColumn = json['is_column'];
    sortOrder = json['sort_order'];
    status = json['status'];
    lastAdd = json['last_add'];
    image = json['image'];
    imageHome = json['image_home'];
    imageHomeNotUrl = json['image_home_notUrl'];
    name = json['name'];
    describe = json['describe'];
    metaTitle = json['meta_title'];
    metaTagsDescribe = json['meta_tags_describe'];
    metaTagsKeywords = json['meta_tags_keywords'];
    count = json['count'];
    // if (json['child'] != null) {
    //   child = <Null>[];
    //   json['child'].forEach((v) {
    //     child!.add(new .fromJson(v));
    //   });
   // }
    catchild = json['catchild'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['attribute_groups'] = this.attributeGroups;
    data['filters'] = this.filters;
    data['is_top'] = this.isTop;
    data['is_column'] = this.isColumn;
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['last_add'] = this.lastAdd;
    data['image'] = this.image;
    data['image_home'] = this.imageHome;
    data['image_home_notUrl'] = this.imageHomeNotUrl;
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['meta_title'] = this.metaTitle;
    data['meta_tags_describe'] = this.metaTagsDescribe;
    data['meta_tags_keywords'] = this.metaTagsKeywords;
    data['count'] = this.count;
    // if (this.child != null) {
    //   data['child'] = this.child!.map((v) => v?.toJson()).toList();
    // }
    data['catchild'] = this.catchild;
    return data;
  }
}