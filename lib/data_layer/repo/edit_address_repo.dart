import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../helper/api_url/url.dart';
import '../model/estate/add_estate_model.dart';
import '../model/estate/edit_estate_model.dart';

class EditAddressRepo {
  static Future<EditAddressModel> editAddressRepo(
      {var customer,
        country_id,
        region_id,
        address_first_name,
        address_email,
        address_address_1,
        address_address_2,
        address_mobile}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "country_id":0,
      "region_id": region_id,
      "address_first_name": address_first_name,
      "address_email": address_email,
      "address_mobile": address_mobile,
      "address_address_1": address_address_1,
      "address_address_2": address_address_2
    };
    EditAddressModel address = EditAddressModel();
    var response = await http.post(
        Uri.https(ApiBaseUrl, "/hoper/ad_panel/api/customerUpdateAddress"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      address = EditAddressModeldelFromMap(response.body);
    }
    return address;
  }
}
