import 'dart:convert';

import 'package:hoper/data_layer/model/profile/profile_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/cart/customer_cart_model.dart';

class CartRepo {
  static Future<CustomerCartModel> getCartRepo(
      {var customer, language_id, country_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "language_id": language_id,
      "country_id": country_id
    };
    CustomerCartModel customerCartModel = CustomerCartModel();
    var response =
        await http.post(Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/customerCart"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      customerCartModel = cartodelFromMap(response.body);
    }
    return customerCartModel;
  }
}
