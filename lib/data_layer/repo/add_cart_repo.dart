import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import '../model/cart/cutomer_cart_add_model.dart';



class AddCartRepoistory {
  static Future<CustomerCartAddModel> getCartAdd(
      {var customer, quantity, product_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "product_id": product_id,
      "quantity": quantity
    };
    CustomerCartAddModel addCart =CustomerCartAddModel();
    var response =
    await http.post(Uri.https(ApiBaseUrl,Addecart), body: jsonEncode(body));
    if (response.statusCode == 200) {
      addCart = addCartFrom(response.body);
    }
    return addCart;
  }
}
