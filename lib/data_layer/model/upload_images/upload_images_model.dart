import 'dart:convert';

UploadImageModel UploadImageModelFrommap(String str) =>
    UploadImageModel.fromJson(json.decode(str));


class UploadImageModel {
  String? imageName;
  String? imagePath;
  int? error;
  String? recValue;

  UploadImageModel({this.imageName, this.imagePath, this.error, this.recValue});

  UploadImageModel.fromJson(Map<String, dynamic> json) {
    imageName = json['image_name'];
    imagePath = json['image_path'];
    error = json['error'];
    recValue = json['rec_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_name'] = this.imageName;
    data['image_path'] = this.imagePath;
    data['error'] = this.error;
    data['rec_value'] = this.recValue;
    return data;
  }
}