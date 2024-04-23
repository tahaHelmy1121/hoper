import 'dart:convert';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/pages/pages_model.dart';

class PagesRepo {
  static Future<List<PagesModel>> getPageRepo(
      {var customer, language_id, country_id}) async {
    Map<String, dynamic> body = {
      "language_id": language_id,
    };
    List<PagesModel> pages =[];
    var response =
    await http.post(Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/pages"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      pages = pagesModelRouteFromMap(response.body);
    }
    return pages;
  }
}
