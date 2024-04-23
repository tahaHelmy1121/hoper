import 'dart:convert';

import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/chat/all_supports_model.dart';
import '../model/chat/new_support_model.dart';

class ChatRepo {
  static Future<List<SupportAllMassageModel>> getSupportRepo(
      {var customer, language_id, country_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "language_id": language_id,
    };
  List<SupportAllMassageModel>   customerCartModel = [];
    var response =
    await http.post(Uri.parse("https://erp.gt4it.com/hoper/ad_panel/api/supportMessages"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      customerCartModel = CustomerSupportModelModelRouteFromMap(response.body);
    }
    return customerCartModel;
  }

  static Future<NewSupportAllMassageModel> sendAllMassage(
      {var customer, language_id, country_id,message,msg_type}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "message":message,
      "msg_type":0,
      "language_id": language_id,
    };
    NewSupportAllMassageModel newSupportAllMassageModel = NewSupportAllMassageModel();
    var response =
    await http.post(Uri.parse("https://erp.gt4it.com/hoper/ad_panel/api/newSupportMessageAllTypes"), body: jsonEncode(body));
    if (response.statusCode == 200) {
      newSupportAllMassageModel = NewSupportodelFromMap(response.body);
    }
    return newSupportAllMassageModel;
  }
}
