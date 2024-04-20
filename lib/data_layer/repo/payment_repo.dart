import 'package:hoper/data_layer/model/categories/categories_model.dart';
import 'package:hoper/data_layer/model/slider/slider_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/payment_methods/payment_model.dart';


class PAymentRepoistory {
  static Future<List<PaymentModel>> getPaymentRepo({var customer}) async {
    Map<String, dynamic> body = {"customer": customer};
    List<PaymentModel> pay = [];
    var response = await http.post(Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/paymentMethods"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      pay = paymentModelRouteFromMap(response.body);
    }
    return pay;
  }
}
