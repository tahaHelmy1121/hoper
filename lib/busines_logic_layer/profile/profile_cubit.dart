import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hoper/busines_logic_layer/profile/profile_state.dart';
import 'package:hoper/data_layer/model/profile/edit_profile_model.dart';
import 'package:hoper/data_layer/model/profile/profile_model.dart';
import 'package:hoper/data_layer/repo/profile_repo.dart';
import 'package:hoper/helper/cache_helper.dart';
import 'package:hoper/helper/di/di.dart';
import 'package:hoper/presntion_layer/splashview.dart';
import 'package:image_picker/image_picker.dart';

import '../../data_layer/repo/edit_profile_repo.dart';
import '../../helper/imagesServices.dart';
import '../../helper/massage.dart';
import '../../helper/resultprocess.dart';
import '../../presntion_layer/home/home_view.dart';
import '../../shared_widget/drew_nav_bar.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState);

  ProfileModel profileModel = ProfileModel();
  List<File> resturantBannerImages = [];


  getProfile() async {
    emit(ProfileState.loading());
    var csutomer = sl<CacheHelper>().getData(key: "id");
    profileModel = await ProfileRepo.getProfileRepo(customer: csutomer);
    emit(ProfileState.success());
  }




//=========================//editProfile==========================
  TextEditingController userEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  UpdateProfile updateProfile = UpdateProfile();

  editProfile(
      {first_name,
      context,
      last_name,
      user_email,
      mobile,
      user_name,
      country_id,
      region_id,
      language_id,
      id}) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    updateProfile = await EditProfile.getEditProfileRepo(
        first_name: firstnameController.text,
        user_email: userEmailController.text,
        mobile: phoneController.text,
        id: csutomer.toString());
    if (updateProfile.status == 1) {
      MassageApp.flusherBarErrorMassage(
          context, updateProfile.reason.toString(), "", (flushbar) {});
   //   Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SplashView()));
      emit(ProfileState.success());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: updateProfile.reason.toString(),
          status: false);
    }

  }

}

