import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hoper/busines_logic_layer/register/register_state.dart';
import 'package:hoper/data_layer/model/auth/resgister_model.dart';
import 'package:hoper/data_layer/repo/register_repo.dart';
import 'package:hoper/presntion_layer/auth/login/login_view.dart';
import 'package:hoper/presntion_layer/splashview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_layer/model/auth/forget_model.dart';
import '../../data_layer/model/auth/reset_model.dart';
import '../../data_layer/repo/forget_repo.dart';
import '../../data_layer/repo/verifycode_repo.dart';
import '../../helper/massage.dart';
import '../../helper/resultprocess.dart';
import '../../presntion_layer/auth/verifycode/verifycode.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(super.initialState);

  TextEditingController userEdtingController = TextEditingController();
  TextEditingController mobileEdtingController = TextEditingController();
  TextEditingController emailEdtingController = TextEditingController();
  TextEditingController passwordEdtingController = TextEditingController();
  TextEditingController lastNameEdtingController = TextEditingController();
  TextEditingController userNameEdtingController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  RegisterModel registerModel = RegisterModel();
  SharedPreferences? sharedPreferences;
  final TextEditingController verifyController = TextEditingController();
  ResetModel verifyCode = ResetModel();

  final GlobalKey<FormState> forgetKeyVerify = GlobalKey<FormState>();
  TextEditingController verifyControoler  = TextEditingController();
  TextEditingController verifyControolerPass  = TextEditingController();
  verifySendData({code, required context}) async {
    verifyCode = await VerifyCodeRepo.getConfaimationRepo(
      user_name: verifyControoler.text,
      password:verifyControolerPass.text ,
      context: context,
      code:"123456",
    );
    if (verifyCode.status ==1) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: "تم تفعيل حسابك بنجاح الرجاء تسجيل الدخول ",
      );
      Navigator.push(context, MaterialPageRoute(builder:(_)=>LoginView()));
    } else {
      print("error ");
      ResultProcess.drewResultProcess(
          context: context,
          reson: verifyCode.reason.toString(),
          status: false);
    }
  }
  emitRegisterCubit({required context, lastName}) async {
    //  emit(LoginState.loading());
    if (key.currentState!.validate()) {
      registerModel = await RegisterRepo.getRegisterRepo(
          first_name: userEdtingController.text,
          language_id: "2",
          region_id: "2",
          country_id: "2",
          last_name: lastNameEdtingController.text,
          mobile: mobileEdtingController.text,
          password: passwordEdtingController.text,
          user_email: emailEdtingController.text,
          user_name: userNameEdtingController.text);
      //   emit(LoginState.success());
      if (registerModel.status == 1) {
        emit(RegisterState.success());
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences!.setString("name", registerModel.userName.toString());
        sharedPreferences!
            .setString("customerId", registerModel.userId!.toString());
        sharedPreferences!
            .setString("group_id", registerModel.groupId.toString());
        MassageApp.flusherBarErrorMassage(
            context, registerModel.reason.toString(), "", (flushbar) {});
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginView()));
      } else {
        emit(RegisterState.error(error: registerModel.reason.toString()));
        MassageApp.toastMassage(registerModel.reason.toString());
      }
    }
  }
  final TextEditingController emailForget = TextEditingController();
  ForgetModel forgetPasswordModel = ForgetModel();

  final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  forgetPass({ required BuildContext context, forget}) async {
    forgetPasswordModel =
    await ForgetRepo.getForgetRepo(user_email: emailForget.text);
    if (forgetPasswordModel.status == 1) {
      MassageApp.flusherBarErrorMassage(
          context, forgetPasswordModel.reason.toString(), "", (flushbar) {});
      emit(RegisterState.success());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Text(
          forgetPasswordModel.reason.toString(),
          style: const TextStyle(fontFamily: "Almarai"),
        ),
        elevation: 10,
        duration: const Duration(seconds: 1),
      ));
    }


  }
  }

