import 'package:bloc/bloc.dart';
import 'package:hoper/data_layer/model/order/confirmation_order_from_cart.dart';
import 'package:meta/meta.dart';

import '../../data_layer/model/order/order.dart';
import '../../data_layer/repo/get_all_orders_repo.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  OrdersModel ordersModel = OrdersModel();
  List<OrdersModel>order = [];
  emitOrders() async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    order = await GetAllOrderRepo.getOrderRepo(customer:csutomer );
     emit(OrderSuccess());
  }




}
