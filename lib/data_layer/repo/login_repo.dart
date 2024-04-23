import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/auth/login_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class LoginRepo {
  static Future<LoginModel> getLoginRepo(
      {var phone, password, device_id,device_token}) async {
    Map<String, dynamic> body = {
      "user_name": phone,
      "password": password,
      "language_id": device_id.toString(),
    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,login),
      headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      print("=================${result.reason?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      return result;
    }
  }
}
