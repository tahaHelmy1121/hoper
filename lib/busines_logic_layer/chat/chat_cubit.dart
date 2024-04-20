import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoper/data_layer/repo/chat_repo.dart';
import 'package:hoper/helper/massage.dart';

import '../../data_layer/model/chat/all_supports_model.dart';
import '../../data_layer/model/chat/new_support_model.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<SupportAllMassageModel> supportAllMassageModel = [];

  getAllSupport() async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    supportAllMassageModel = await ChatRepo.getSupportRepo(customer: csutomer);
    print(supportAllMassageModel.first.message);
    emit(ChatSuccess());
  }

  TextEditingController textEditingController = TextEditingController();

  NewSupportAllMassageModel newSupportAllMassageModel =
      NewSupportAllMassageModel();

  sendMessages({var message, context}) async {
    var csutomerId = sl<CacheHelper>().getData(key: "id");
    newSupportAllMassageModel = await ChatRepo.sendAllMassage(
        customer: csutomerId, message: textEditingController.text.trim());
    getAllSupport();
    if (newSupportAllMassageModel.status == 1) {
      MassageApp.snackBar(newSupportAllMassageModel.reason.toString(), context);
      getAllSupport();
    } else {
      MassageApp.snackBar(newSupportAllMassageModel.reason.toString(), context);
    }
  }
}
