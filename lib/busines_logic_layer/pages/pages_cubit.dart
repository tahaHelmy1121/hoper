import 'package:bloc/bloc.dart';
import 'package:hoper/data_layer/model/pages/pages_model.dart';
import 'package:hoper/data_layer/repo/pages_repo.dart';
import 'package:meta/meta.dart';

import '../../data_layer/model/cart/customer_cart_model.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  PagesCubit() : super(PagesInitial());

  List<PagesModel> pages = [];


  getAbout() async {
    emit(pagesLoading());
    var csutomer = sl<CacheHelper>().getData(key: "id");
    pages = await PagesRepo.getPageRepo(customer: csutomer);
    emit(pagesSuccess());
  }


}
