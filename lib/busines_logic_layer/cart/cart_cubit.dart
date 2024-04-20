import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoper/data_layer/repo/cart_repo.dart';
import 'package:hoper/data_layer/repo/delete_Cart_repo.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/payment.dart';
import 'package:images_picker/images_picker.dart';

import '../../data_layer/model/cart/customer_cart_model.dart';
import '../../data_layer/model/cart/cutomer_cart_add_model.dart';
import '../../data_layer/model/cart/delete_cart_model.dart';
import '../../data_layer/model/order/confirmation_order_from_cart.dart';
import '../../data_layer/model/upload_images/upload_images_model.dart';
import '../../data_layer/repo/add_cart_repo.dart';
import '../../data_layer/repo/confirmation_order_from_cart.dart';
import '../../data_layer/repo/upload_images_repo.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';
import '../../helper/massage.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  CustomerCartModel customerCartModel = CustomerCartModel();

  getCart() async {
    emit(CartState.loading());
    var csutomer = sl<CacheHelper>().getData(key: "id");
    customerCartModel = await CartRepo.getCartRepo(customer: csutomer);
    emit(CartState.success());
  }

  DeleteCartModel deleteCartModel = DeleteCartModel();

  getRemoveToCart({
    cartItemId,
    context,
    index,
  }) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    deleteCartModel = await DeleteCartRepoistory.getCartDelete(
      customer: csutomer,
      product_id: cartItemId,
    );
    emit(CartState.success());
    getCart();
    if (deleteCartModel.status == 1) {
      MassageApp.flusherBarErrorMassage(
          context, deleteCartModel.reason.toString(), "", (flushbar) {});
      //  emit(CartState.success());
      getCart();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, deleteCartModel.reason.toString(), "", (flushbar) {});
    }
    emit(CartState.error(error: deleteCartModel.reason.toString()));
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  }

  CustomerCartAddModel addCartModel = CustomerCartAddModel();

  getAddToCart(
      {cartItemId, required BuildContext context, index, quantity}) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    addCartModel = await AddCartRepoistory.getCartAdd(
      customer: csutomer,
      product_id: cartItemId,
    );
    if (addCartModel.status == 1) {
      MassageApp.snackBar(addCartModel.reason.toString(), context);
      context.push(ChosePayment(), context);
    } else {
      MassageApp.flusherBarErrorMassage(
          context, addCartModel.reason.toString(), "", (flushbar) {});
    }
    emit(CartState.success());
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  }

//
  ConfirmationOrderFromCart confirmationOrderFromCart =
      ConfirmationOrderFromCart();
  File? _file;

  File? get file => _file;

  set file(File? value) {
    _file = value;
  }
  String? _imageBase;

  String? get imageBase => _imageBase;

  set imageBase(String? value) {
    _imageBase = value;
  }
  UploadImageModel resultUpload = UploadImageModel();
  uploadImage({required BuildContext context}) async {
    var res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
      language: Language.System,
      gif: true,
      cropOpt: CropOption(
        aspectRatio: CropAspectRatio.wh16x9,
        cropType: CropType.circle,
      ),
    );
    if (res != null) {
      res.map((e) async {
        _file = File(e.path);
        imageBase = base64Encode(_file!.readAsBytesSync());
        resultUpload = await ImagesRepoRepo.getImageRepo(
            image: _imageBase);
        print(_imageBase.toString());
      }).toList();
    }

  }
  addOrderFromCart(
      {customer_id, product_id, file_name, payment_method_id , required BuildContext context}) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    if(confirmationOrderFromCart.status ==1){
      MassageApp.snackBar(confirmationOrderFromCart.reason.toString(), context);
      confirmationOrderFromCart =
      await ConfirmationOrderFromCartRepo.getEditOrderRepo(
        customer_id: csutomer,
        payment_method_id: "1",
        file_name: _imageBase,
        product_id: product_id,
      );
    }else{
      MassageApp.snackBar(confirmationOrderFromCart.reason.toString(), context);
    }
  }
}
