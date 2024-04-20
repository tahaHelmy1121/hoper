import 'package:hoper/data_layer/model/categories/categories_model.dart';
import 'package:hoper/data_layer/model/slider/slider_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/regions/regions_model.dart';


class RegionsRepoistory {
  static Future<List<RegionsModel>> getRegionsRepo({var customer}) async {
    Map<String, dynamic> body = {"customer": customer};
    List<RegionsModel> regions = [];
    var response = await http.post(Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/regions"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      regions = regionsModelRouteFromMap(response.body);
    }
    return regions;
  }
}
