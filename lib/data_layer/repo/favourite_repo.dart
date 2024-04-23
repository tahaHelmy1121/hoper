import 'dart:convert';

import 'package:hoper/data_layer/model/favourite/customer_favourite_model.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:http/http.dart' as http;

import '../model/favourite/add_favourite_model.dart';
import '../model/favourite/remove_fav_moodel.dart';

class FavouriteRepoistory {
  static Future<List<CustomerFavoriteModel>> getFavouriteRepo({
    var customer,
  }) async {
    Map<String, dynamic> body = {"customer_id": customer};
    List<CustomerFavoriteModel> favourite = [];
    var response =
        await http.post(Uri.https(ApiBaseUrl,fav), body: jsonEncode(body));
    if (response.statusCode == 200) {
      favourite = CustomerFavoriteModelModelRouteFromMap(response.body);
    }
    return favourite;
  }
}

class AddFavouriteRepoistory {
  static Future<CustomerAddFavoriteModel> getFavouriteRepo(
      {var customer, language_id, product_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "product_id": product_id,
      "language_id": language_id
    };
    CustomerAddFavoriteModel favourite =CustomerAddFavoriteModel();
    var response =
    await http.post(Uri.https(ApiBaseUrl,Addfav), body: jsonEncode(body));
    if (response.statusCode == 200) {
      favourite = AddfavodelFromMap(response.body);
    }
    return favourite;
  }
}
class RemoveFavouriteRepoistory {
  static Future<RemoveFavModel> getRemoveFavouriteRepo(
      {var customer, language_id, product_id}) async {
    Map<String, dynamic> body = {
      "customer_id": customer,
      "product_id": product_id,
      "language_id": language_id
    };
    RemoveFavModel favourite =RemoveFavModel();
    var response =
    await http.post(Uri.https(ApiBaseUrl,removefav), body: jsonEncode(body));
    if (response.statusCode == 200) {
      favourite = RemovefavodelFromMap(response.body);
    }
    return favourite;
  }
}

///
