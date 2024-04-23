import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import '../../helper/api_url/url.dart';
import '../model/auth/reset_model.dart';


dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class VerifyCodeRepo {
  static Future<ResetModel> getConfaimationRepo({var user_name,code ,type,token,context,password}) async {
    Map<String, dynamic> body = {
      "verification_code": code.toString(),
      "user_name":user_name.toString(),
      "password":password.toString(),
   //   "type":"ios",

    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/customerResetPassword"),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResetModel.fromJson(json);
      print("=================${result.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResetModel.fromJson(json);
      print("=================${result.reason.toString()}=================");
      return result;
    }
  }
}
