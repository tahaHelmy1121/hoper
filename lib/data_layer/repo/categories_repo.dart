import 'dart:convert';

import 'package:hoper/data_layer/model/categories/categories_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

class CategoryRepoistory {
  static Future<List<CategoriesModel>> getcategoryRepo({
    var customer,
    language_id
  }) async {
    Map<String, dynamic> body = {"customer": customer , "language_id":language_id};
    List<CategoriesModel> listcat = [];
    var response = await http.post(Uri.https(ApiBaseUrl, categories),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      listcat = categoryModelRouteFromMap(response.body);
    }
    return listcat;
  }

}
