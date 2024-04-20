import 'dart:convert';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;
import '../model/estate/delete_estate_model.dart';


class DeleteAddressRepoistory {
  static Future<DeleteAddressModel> geAddressDelete(
      {var customer, language_id, product_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "id": product_id,
      "language_id": language_id
    };
    DeleteAddressModel address =DeleteAddressModel();
    var response =
    await http.post(Uri.https(ApiBaseUrl,DeleteAddress), body: jsonEncode(body));
    if (response.statusCode == 200) {
      address = AddressodelFromMap(response.body);
    }
    return address;
  }
}
