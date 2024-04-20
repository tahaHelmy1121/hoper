
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/estate/estate_model.dart';


class GetAllAddressRepoistory {
  static Future<List<AddressModel>> getAddressRepo({var customer}) async {
    Map<String, dynamic> body = {"customer_id": customer};
    List<AddressModel> address = [];
    var response = await http.post(Uri.https(ApiBaseUrl,"/hoper/ad_panel/api/customerAddresses"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      address = CustomerAddressModelModelRouteFromMap(response.body);
    }
    return address;
  }


}
