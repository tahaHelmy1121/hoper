import 'dart:convert';

import 'package:hoper/data_layer/model/profile/profile_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/cart/customer_cart_model.dart';
import '../model/order/order.dart';

class GetAllOrderRepo {
  static Future<List<OrdersModel>> getOrderRepo(
      {var customer, language_id, country_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "language_id": language_id,
      "country_id": country_id
    };
  List<OrdersModel>  ordersModel =[];
    var response =
    await http.post(Uri.parse("https://erp.gt4it.com/hoper/ad_panel/api/customerOrders"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      ordersModel = orderModelRouteFromMap(response.body);
    }
    return ordersModel;
  }
}
