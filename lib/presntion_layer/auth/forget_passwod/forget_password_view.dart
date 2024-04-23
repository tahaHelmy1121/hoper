import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/register/register_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/auth/verifycode/verifycode.dart';
import 'package:hoper/presntion_layer/auth/widget_auth/drew_any_text.dart';
import 'package:hoper/shared_widget/drew_nav_bar.dart';

import '../../../shared_widget/app_style.dart';
import '../widget_auth/drew_any_from_field.dart';
import '../widget_auth/drew_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 85.w,
                  ),
                  Image.asset("assets/images/logo 1.jpg"),
                  SizedBox(
                    width: 40.w,
                  ),
                  InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Image.asset("assets/images/Back - Solid.png")),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(right: 11.sp, top: 10.sp),
                  child: drewAnyText(name: "هل نسيت كلمة المرور")),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/amico.jpg"),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20.sp),
                      child: Text(
                          "حدد تفاصيل الاتصال التي ينبغي لنا \nاستخدامها لإعادة تعيين كلمة المرور الخاصة بك",
                          textAlign: TextAlign.end,
                          style: style1Font14Weight400)),
                ],
              ),
              SizedBox(
                height: 65.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          _modalBottomSheetMenu(context: context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(25)),
                          width: 275.w,
                          height: 95.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 20.h),
                                      child: Text(
                                        "بواسطة رساله",
                                        style: style1Font14Weight400.copyWith(
                                            color: Colors.grey),
                                      )),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                      child: Text(
                                        "+91 00*****45",
                                        style: style1Font14Weight400.copyWith(
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin:
                                    EdgeInsets.only(left: 14.sp, top: 22.sp),
                                    child:
                                    Image.asset("assets/images/Vector.png"),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 8.sp, bottom: 10),
                                      child: Image.asset(
                                          "assets/images/Ellipse 52.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  void _modalBottomSheetMenu({required BuildContext context }){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,

        context: context,
        builder: (builder){
          return Container(
            decoration: BoxDecoration(
              //       color:Colors.green.shade100, ////
                borderRadius: BorderRadius.circular(45)
            ),
            height: 240.0.h,

            //so you don't have to change MaterialApp canvasColor
            child: Container(
              child:    Column(
                children: [
                  drewAnyTextFromField(
                    icon: Icon(Icons.email_outlined),
                    valid: "ادخال الهاتف",
                    hint: "البريد الاكترونى",
                    myController: context.read<RegisterCubit>().emailForget, context: context,
                  ),
                  InkWell(
                    onTap: (){
                      context.read<RegisterCubit>().forgetPass(context: context);
                      context.push(VerifyCodeView(phone:  context.read<RegisterCubit>().emailForget.text,), context);
                    },
                    child: Container(
                      width: 140.w,
                      height: 63.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor("#49B673")),
                      child: Center(
                        child: Text(
                          "اكتب الاميل ",
                          style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
                decoration: BoxDecoration(
                    color:Colors.white, //
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70.0),
                        topRight: Radius.circular(70.0))),
             ),
          );
        }
    );
  }
}
