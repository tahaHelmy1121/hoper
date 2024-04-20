import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import '../model/cart/delete_cart_model.dart';
import '../model/favourite/add_favourite_model.dart';




class DeleteCartRepoistory {
  static Future<DeleteCartModel> getCartDelete(
      {var customer, language_id, product_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "id": product_id,
      "language_id": language_id
    };
    DeleteCartModel deleteCart =DeleteCartModel();
    var response =
    await http.post(Uri.https(ApiBaseUrl,Deletecart), body: jsonEncode(body));
    if (response.statusCode == 200) {
      deleteCart = cartodelFromMap(response.body);
    }
    return deleteCart;
  }
}
