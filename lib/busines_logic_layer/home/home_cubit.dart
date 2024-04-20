import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hoper/data_layer/model/categories/categories_model.dart';
import 'package:hoper/data_layer/model/products/products_model.dart';
import 'package:hoper/data_layer/model/slider/slider_model.dart';
import 'package:hoper/data_layer/repo/categories_repo.dart';
import 'package:hoper/data_layer/repo/products_repo.dart';
import 'package:hoper/data_layer/repo/slider_repo.dart';
import 'package:hoper/helper/cache_helper.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/helper/massage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_layer/model/sub_category_model.dart';
import '../../helper/di/di.dart';
import '../../presntion_layer/home/widget/drew_sub_categories/drew_sub_categories.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState) {}

  List<CategoriesModel> categoriesModel = [];
  List<SlidersModel> sliderModel = [];
  List<ProductsModel> productsModel = [];
  List<SubCategoryModel> subCategory = [];

  emitSubCategories({id}) async {
    emit(HomeState.loading());
    subCategory = await ProductsRepoistory.getSubProductsRepo(
      language_id: langCode,
      category_parent_id: id,
    );
    print(subCategory.length);
    emit(HomeState.success());

  }

  //////////////////////////////////
  String langCode = '1';

  void changeLang(String codeLang) async {
    langCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(
        codeLang); //=>Note this is function response to localization dynamic data from api
  }

  void getCachedLang() {
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
  }

  ///////////////////////////////////////////
  emitCategories({id, language_id}) async {
    emit(const HomeState.loading());
    categoriesModel =
        await CategoryRepoistory.getcategoryRepo(language_id: langCode);
    emit(HomeState.success());
    //   emitSubCategories();
  }

  int tappedIndex = 0;

  changeCurrentIndex({index}) {
    tappedIndex = index;
    emit(HomeState.success());
  }

  emitSlider({id, language_id}) async {
    emit(const HomeState.loading());
    sliderModel = await SliderRepoistory.getSliderRepo();
    emit(const HomeState.success());
  }

  emitAnyProducts({id, language_id}) async {
    emit(const HomeState.loading());
    productsModel =
        await ProductsRepoistory.getProductsRepo(language_id: langCode);
    // emitSubCategories();
    emit(const HomeState.success());
  }

  TextEditingController searchController = TextEditingController();
  bool isSearch = true;
  bool searchLoading = true;

  checkSearch(val) {
    if (val == "") {
      isSearch = true;
      emit(HomeState.success());
    }

    emit(HomeState.success());
  }

  onSearchItems() {
    isSearch = false;
    emit(HomeState.success());
    getSearchData();
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  List<ProductsModel> search = [];

  getSearchData() async {
    // searchLoading = true;
    search = await ProductsRepoistory.getProductsRepo(
        search_name: searchController.text);

    emit(HomeState.success());
  }
}
