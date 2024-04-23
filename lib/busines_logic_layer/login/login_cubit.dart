import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hoper/data_layer/repo/login_repo.dart';
import 'package:hoper/data_layer/model/auth/login_model.dart';
import 'package:hoper/helper/cache_helper.dart';
import 'package:hoper/shared_widget/drew_nav_bar.dart';
import '../../helper/di/di.dart';
import '../../helper/massage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(super.initialState);

  TextEditingController emailEdtingController = TextEditingController();
  TextEditingController passwordEdtingController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();
  //==============social auth here //============================



  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
   if(loginResult==null){
     return ;
   }
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


  emitLoginCubit({required context}) async {
    //  emit(LoginState.loading());
    if (key.currentState!.validate()) {
      loginModel = await LoginRepo.getLoginRepo(
          phone: emailEdtingController.text,
          password: passwordEdtingController.text,
          device_id: "2");
      //   emit(LoginState.success());
      if (loginModel.status ==1) {
        emit(LoginState.success());
        sl<CacheHelper>().saveData(key:"name", value: loginModel.profile!.userEmail);
        sl<CacheHelper>().saveData(key:"id", value: loginModel.profile!.id);
        sl<CacheHelper>().saveData(key:"mobile", value: loginModel.profile!.mobile);
        MassageApp.flusherBarErrorMassage(context, loginModel.reason.toString(), "", (flushbar) { });
        Navigator.push(context, MaterialPageRoute(builder:(_)=>CustomNavBar()));
      } else {
        emit(LoginState.error(error: loginModel.reason.toString()));
        MassageApp.toastMassage(loginModel.reason.toString());
      }
    }
  }
}
