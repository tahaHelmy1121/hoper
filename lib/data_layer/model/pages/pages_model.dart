import 'dart:convert';

List<PagesModel> pagesModelRouteFromMap(String str) =>
    List<PagesModel>.from(
        json.decode(str).map((x) => PagesModel.fromJson(x)));


class PagesModel {
 var id;
 var isBottom;
 var sortOrder;
 var status;
 var name1;
 var name;
 var describe;
 var metaTitle;
 var metaTagsDescribe;
 var metaTagsKeywords;
 var image;

  PagesModel(
      {this.id,
        this.isBottom,
        this.sortOrder,
        this.status,
        this.name1,
        this.name,
        this.describe,
        this.metaTitle,
        this.metaTagsDescribe,
        this.metaTagsKeywords,
        this.image});

  PagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isBottom = json['is_bottom'];
    sortOrder = json['sort_order'];
    status = json['status'];
    name1 = json['name1'];
    name = json['name'];
    describe = json['describe'];
    metaTitle = json['meta_title'];
    metaTagsDescribe = json['meta_tags_describe'];
    metaTagsKeywords = json['meta_tags_keywords'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_bottom'] = this.isBottom;
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['name1'] = this.name1;
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['meta_title'] = this.metaTitle;
    data['meta_tags_describe'] = this.metaTagsDescribe;
    data['meta_tags_keywords'] = this.metaTagsKeywords;
    data['image'] = this.image;
    return data;
  }
}