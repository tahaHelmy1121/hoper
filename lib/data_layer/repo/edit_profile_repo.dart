import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/auth/login_model.dart';
import '../model/profile/edit_profile_model.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class EditProfile {
  static Future<UpdateProfile> getEditProfileRepo(
      {var first_name,
        last_name,
        user_email,
        mobile,
        user_name,
        country_id,
        region_id,
        language_id,
        id}) async {
    Map<String, dynamic> body = {
      "first_name": first_name,
      "last_name": last_name,
      "user_email": user_email.toString(),
      "mobile": mobile.toString(),
      "user_name": user_name,
      "country_id": country_id.toString(),
      "region_id": region_id.toString(),
      "language_id": language_id.toString(),
      "id": id.toString(),

    };

    var response = await http.post(
      Uri.https(ApiBaseUrl,editprofile),
      //   headers: {'AUTHORIZATION': 'Bearer $device_token'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = UpdateProfile.fromJson(json);
      print("=================${result.reason?.toString()}=================");
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = UpdateProfile.fromJson(json);
      return result;
    }
  }
}
