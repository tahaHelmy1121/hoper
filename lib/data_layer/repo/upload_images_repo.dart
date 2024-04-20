import 'dart:convert';

import 'package:hoper/data_layer/model/profile/profile_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/cart/customer_cart_model.dart';
import '../model/upload_images/upload_images_model.dart';

class ImagesRepoRepo {
  static Future<UploadImageModel> getImageRepo(
      {var image}) async {
    Map<String, dynamic> body = {
      "image": image,
    };
    UploadImageModel imageModel = UploadImageModel();
    var response =
    await http.post(Uri.parse("https://erp.gt4it.com/hoper/ad_panel/api/uploadImage"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      imageModel = UploadImageModelFrommap(response.body);
    }
    return imageModel;
  }
}
