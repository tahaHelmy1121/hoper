import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoper/helper/api_url/url.dart';
import 'package:hoper/helper/massage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_layer/model/favourite/add_favourite_model.dart';
import '../../data_layer/model/favourite/customer_favourite_model.dart';
import '../../data_layer/model/favourite/remove_fav_moodel.dart';
import '../../data_layer/repo/favourite_repo.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(super.initialState);

  List<CustomerFavoriteModel> fav = [];
  int tappedIndex = 0;
  changeCurrentIndex({index}){
    tappedIndex=  index;
    emit(FavouriteState.success());
  }

  getFav() async {
    emit(FavouriteState.loading());
    var csutomer = sl<CacheHelper>().getData(key: "id");
    fav = await FavouriteRepoistory.getFavouriteRepo(customer: csutomer);
    emit(FavouriteState.success());
  }

  CustomerAddFavoriteModel customerAddFavoriteModel =
  CustomerAddFavoriteModel();

  getAddFavourite({id, required BuildContext context, index}) async {
    //  emit(FavouriteState.loading());
    var csutomer = sl<CacheHelper>().getData(key: "id");
    customerAddFavoriteModel = await AddFavouriteRepoistory.getFavouriteRepo(
      customer: csutomer,
      product_id: id,
    );
    if (customerAddFavoriteModel.status == 1) {
      MassageApp.snackBar(customerAddFavoriteModel.reason.toString(), context);
      //   emit(FavouriteState.success());
      getFav();
    } else {
      MassageApp.snackBar("خطاء", context);
    }
  }
   RemoveFavModel removeFavModel = RemoveFavModel();
  getRemoveToFav({
    context,
    index,
    favv
  }) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    getFav();
    removeFavModel = await RemoveFavouriteRepoistory.getRemoveFavouriteRepo(
      customer: csutomer,
      product_id: favv,

    );
    // emit(FavouriteState.success());
    // getFav();
    if (customerAddFavoriteModel.status == 1) {

      MassageApp.snackBar(removeFavModel.reason, context);
      getFav();
    //  emit(FavouriteState.success());
    } else {
      if (customerAddFavoriteModel.status == 2) {
        MassageApp.snackBar(
            customerAddFavoriteModel.reason.toString(), context);
        emit(FavouriteState.error(error: customerAddFavoriteModel.reason.toString()));
      }
      print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
    }
  }
}