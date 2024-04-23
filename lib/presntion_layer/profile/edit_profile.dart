import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/profile/profile_cubit.dart';
import 'package:hoper/busines_logic_layer/upload_images/upload_images_cubit.dart';

import '../../data_layer/repo/upload_images_repo.dart';
import '../../shared_widget/drew_background_color.dart';
import '../auth/widget_auth/drew_any_from_field.dart';
import '../auth/widget_auth/drew_button.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void setState(VoidCallback fn) {
    // BlocProvider.of<UploadImagesCubit>(context).uploadAndSaveImage();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  drewBackGroundColors(),
                  Container(
                    margin: EdgeInsets.only(top: 35.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/images/OIP.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                          width: 100.w,
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Image.asset(
                                              "assets/images/Edit.png"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    drewAnyTextFromField(
                                        context: context,
                                        myController: context
                                            .watch<ProfileCubit>()
                                            .firstnameController,
                                        icon: Icon(Icons.person),
                                        hint: "اسم الايميل"),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    drewAnyTextFromField(
                                        myController: context
                                            .watch<ProfileCubit>()
                                            .phoneController,
                                        icon: Icon(Icons.phone),
                                        context: context,
                                        hint: "رقم الهاتف"),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    drewAnyTextFromField(
                                        myController: context
                                            .watch<ProfileCubit>()
                                            .userEmailController,
                                        context: context,
                                        icon: Icon(Icons.email_outlined),
                                        hint: "البريد الاكترونى"),
                                    drewCustomButton(
                                        on: () {
                                          context
                                              .read<ProfileCubit>()
                                              .editProfile(context: context);
                                          setState(() {
                                            context
                                                .read<ProfileCubit>()
                                                .firstnameController
                                                .clear();
                                            context
                                                .read<ProfileCubit>()
                                                .userEmailController
                                                .clear();
                                            context
                                                .read<ProfileCubit>()
                                                .phoneController
                                                .clear();
                                          });
                                        },
                                        context: context,
                                        name: "تعديل بياناتى"),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(children: []),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
