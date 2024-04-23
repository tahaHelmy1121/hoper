import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/register/register_cubit.dart';
import 'package:hoper/busines_logic_layer/register/register_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/auth/login/login_view.dart';
import 'package:hoper/presntion_layer/auth/widget_auth/drew_any_text.dart';

import '../../../shared_widget/app_style.dart';
import '../../../shared_widget/statusapp/OffLineScreen.dart';
import '../../../shared_widget/statusapp/loadingScreen.dart';
import '../forget_passwod/forget_password_view.dart';
import '../widget_auth/dont_have_account_text.dart';
import '../widget_auth/drew_any_from_field.dart';
import '../widget_auth/drew_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegisterCubit(RegisterState.initial()),
  child: Scaffold(
      body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.when(
              initial: () => Text(""),
              loading: () => LoadingScreen(),
              success: () => drewRegisterBody(context: context),
              error: (e) => OffLineScreen());
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: drewRegisterBody(context: context),
          );
        },
      )),
    ),
);
  }

  Widget drewRegisterBody({required BuildContext context }) {
    return Form(
      key: context.read<RegisterCubit>().key,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 75.w,
              ),
              Image.asset("assets/images/logo 1.jpg"),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Image.asset("assets/images/Back - Solid.png")),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 20.sp, right: 10.sp),
              child: drewAnyText(name: "انشاء حساب")),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 20.sp),
                  child: Text(
                      "يمكنك الاطلاع على العقارات والمشاريع الجديدة لدينا  والحجز بسهوله",
                      textAlign: TextAlign.end,
                      style: style1Font14Weight400)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          drewAnyTextFromField(
            icon: Icon(Icons.account_circle_outlined),
            valid: "ادخال الاسم",
            hint: "الاسم بالكامل",
            context: context,
            myController: context.read<RegisterCubit>().userNameEdtingController,
          ),
          drewAnyTextFromField(
            icon: Icon(Icons.phone),
            valid: "ادخال الهاتف",
            hint: "رقم الهاتف",
            context: context,
            myController: context.read<RegisterCubit>().mobileEdtingController,
            // myController:
            // context.read<LoginCubit>().emailEdtingController,
          ),

          drewAnyTextFromField(
            icon: Icon(Icons.email_outlined),
            valid: "ادخال البريد الاكترونى",
            hint: "البريد الاكترونى",
            context: context,
            myController: context.read<RegisterCubit>().emailEdtingController,
            // myController:
            // context.read<LoginCubit>().emailEdtingController,
          ),
          drewAnyTextFromField(
            icon: Icon(Icons.lock_open_outlined),
            valid: "ادخال كلمة المرور",
            hint: "كلمة المرور",
            context: context,
            myController: context.read<RegisterCubit>().passwordEdtingController,
            // myController:
            // context.read<LoginCubit>().emailEdtingController,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.push(ForgetPassword(), context);
                },
                child: Container(
                    margin: EdgeInsets.only(left: 14.sp),
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: GoogleFonts.tajawal(
                          color: HexColor("#49B673"),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          drewCustomButton(context: context, name: "انشاء حساب", on: () {
            context.read<RegisterCubit>().emitRegisterCubit(context: context);
          }),
          SizedBox(
            height: 20.h,
          ),
          DontHaveAccountText(
            textSpan: " لديك حساب ؟ ",
            TextRich: ' سجل الان', tab: () {
              context.push(LoginView(), context);
          },
          ),
          //     DontHaveAccountText(),ليس لديك حساب ؟
        ],
      ),
    );
  }
}
