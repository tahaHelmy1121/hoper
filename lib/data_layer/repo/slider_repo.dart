import 'package:hoper/data_layer/model/categories/categories_model.dart';
import 'package:hoper/data_layer/model/slider/slider_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SliderRepoistory {
  static Future<List<SlidersModel>> getSliderRepo({var customer}) async {
    Map<String, dynamic> body = {"customer": customer};
    List<SlidersModel> listcat = [];
    var response = await http.post(Uri.https(ApiBaseUrl,slider),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      listcat = sliderModelRouteFromMap(response.body);
    }
    return listcat;
  }
}
