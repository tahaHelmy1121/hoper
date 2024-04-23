
import 'package:hoper/data_layer/model/profile/profile_model.dart';
import 'package:hoper/data_layer/model/slider/slider_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProfileRepo {
  static Future<ProfileModel> getProfileRepo({var customer}) async {
    Map<String, dynamic> body = {"id": customer};
   ProfileModel profileModel  = ProfileModel();
    var response = await http.post(Uri.https(ApiBaseUrl,profile),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      profileModel = profileModelFromMap(response.body);
    }
    return profileModel;
  }
}
