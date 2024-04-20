import 'dart:convert';

import 'package:hoper/data_layer/model/products/products_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/sub_category_model.dart';

class ProductsRepoistory {
  static Future<List<ProductsModel>> getProductsRepo(
      {var customer, language_id,search_name}) async {
    Map<String, dynamic> body = {
      "customer": customer,
      "language_id": language_id,
      "search_name": search_name,
    };
    List<ProductsModel> product = [];
    var response = await http.post(Uri.https(ApiBaseUrl, products),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      product = productsModelRouteFromMap(response.body);
    }
    return product;
  }

  static Future<List<SubCategoryModel>> getSubProductsRepo(
      { category_parent_id, language_id,id }) async {
    Map<String, dynamic> body = {
   "category_parent_id":category_parent_id,
    };
    List<SubCategoryModel> Supproduct = [];
    var response = await http.post(Uri.parse("https://erp.gt4it.com/hoper/ad_panel/api/products"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      Supproduct = productsSubModelRouteFromMap(response.body);
    }
    return Supproduct;
  }
}
