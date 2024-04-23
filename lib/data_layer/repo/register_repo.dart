import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:hoper/data_layer/model/auth/resgister_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/auth/login_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RegisterRepo {
  static Future<RegisterModel> getRegisterRepo(
      {var first_name,
      last_name,
      user_email,
      mobile,
      user_name,
      country_id,
      region_id,
      language_id,
      password}) async {
    Map<String, dynamic> body = {
      "first_name": first_name,
      "last_name": last_name,
      "user_email": user_email,
      "mobile": mobile,
      "user_name": user_name,
      "country_id": country_id,
      "region_id": region_id,
      "language_id": language_id,
      "password": password,
    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,register),
      headers: {'AUTHORIZATION': 'Bearer $country_id'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      print("=================${result.reason?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      return result;
    }
  }
}
