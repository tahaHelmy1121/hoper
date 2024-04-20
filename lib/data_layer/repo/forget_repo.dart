import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/auth/forget_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ForgetRepo {
  static Future<ForgetModel> getForgetRepo(
      {var user_email,device_id}) async {
    Map<String, dynamic> body = {
      "user_email": user_email,
      "language_id": device_id.toString(),
    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/customerForgotPassword"),
    //  headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetModel.fromJson(json);
      print("=================${result.reason?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetModel.fromJson(json);
      return result;
    }
  }
}
