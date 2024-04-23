

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/auth/login_model.dart';
import '../model/order/confirmation_order_from_cart.dart';
import '../model/profile/edit_profile_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ConfirmationOrderFromCartRepo {
  static Future<ConfirmationOrderFromCart> getEditOrderRepo(
      {
        product_id,
        file_name,
        customer_id,
        payment_method_id,
        }) async {
    Map<String, dynamic> body = {
      "customer_id":customer_id,
      "product_id": product_id,
      "file_name": file_name,
      "payment_method_id": payment_method_id.toString(),
    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/customerNewOrderFromCart"),
      //   headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ConfirmationOrderFromCart.fromJson(json);
      print("=================${result.reason?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ConfirmationOrderFromCart.fromJson(json);
      return result;
    }
  }
}
