import 'package:bloc/bloc.dart';
import 'package:hoper/helper/cache_helper.dart';
import 'package:meta/meta.dart';

import '../../data_layer/model/payment_methods/payment_model.dart';
import '../../data_layer/repo/payment_repo.dart';
import '../../helper/di/di.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  List<PaymentModel> pay = [];
  int tappedIndex = 0;
  changeCurrentIndex({index}){
    tappedIndex=  index;
    emit(PaymentSccsess());
  }
  getAllPAymentMethods() async {
    var customer = sl<CacheHelper>().getData(key: "id");
    emit(Paymentloading());
    pay = await PAymentRepoistory.getPaymentRepo(customer: customer);
    emit(PaymentSccsess());
  }
}
