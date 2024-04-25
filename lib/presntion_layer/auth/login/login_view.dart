import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/login/login_cubit.dart';
import 'package:hoper/busines_logic_layer/login/login_state.dart';
import 'package:hoper/helper/app_strings.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/auth/register_view/register_view.dart';
import 'package:hoper/shared_widget/app_style.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';

import '../../../shared_widget/drew_nav_bar.dart';
import '../../../shared_widget/statusapp/OffLineScreen.dart';
import '../forget_passwod/forget_password_view.dart';
import '../widget_auth/dont_have_account_text.dart';
import '../widget_auth/drew_any_from_field.dart';
import '../widget_auth/drew_any_text.dart';
import '../widget_auth/drew_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginState.initial()),
        child: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              state.when(
                  initial: () => Text(""),
                  loading: () => LoadingScreen(),
                  success: () => drewLoginBody(context: context),
                  error: (e) => OffLineScreen());
            },
            builder: (context, state) {
              return drewLoginBody(context: context);
            },
          ),
        ),
      ),
    );
  }

  Widget drewLoginBody({required BuildContext context}) {
    Future signInWithGoogle({required BuildContext context}) async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => CustomNavBar()));
    }

    return SingleChildScrollView(
      child: Form(
        key: context.read<LoginCubit>().key,
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            drewAnyText(name: "تسجيل دخول"),
            SizedBox(height: 12.sp),
            Container(
              margin: EdgeInsets.only(bottom: 30.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 20.sp),
                          child: Text(
                              "يمكنك الاطلاع على العقارات والمشاريع الجديدة لدينا  والحجز بسهوله",
                              textAlign: TextAlign.end,
                              style: style1Font14Weight400.copyWith(
                                  overflow: TextOverflow.ellipsis))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.sp,
            ),

            ///

            drewAnyTextFromField(
              icon: Icon(Icons.email_outlined),
              valid: AppStrings.pleaseEnterValidEmail,
              hint: "البريد الاكترونى",
              context: context,
              myController: context.read<LoginCubit>().emailEdtingController,
            ),
            drewAnyTextFromField(
              icon: Icon(Icons.lock_open_sharp),
              valid: "ادخال كلمة المرور",
              hint: "كلمة المرور",
              context: context,
              myController: context.read<LoginCubit>().passwordEdtingController,
            ),

            SizedBox(
              height: 12.sp,
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
              height: 40.h,
            ),
            drewCustomButton(
                on: () {
                  context.read<LoginCubit>().emitLoginCubit(context: context);
                },
                context: context,
                name: "تسجيل دخول"),
            SizedBox(
              height: 30.h,
            ),
            Container(child: Image.asset("assets/images/Separator.png")),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    signInWithGoogle(context: context);
                  },
                  child: Container(
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.black,
                    )),
                    margin: EdgeInsets.only(left: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: HexColor("#F5F4F8"),
                    ),
                    width: 158.5.w,
                    height: 70.h,
                  ),
                ),
                Container(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.blue,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: HexColor("#F5F4F8"),
                  ),
                  width: 158.5.w,
                  height: 70.h,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            DontHaveAccountText(
              textSpan: "ليس لديك حساب ؟ ",
              TextRich: ' انشئ حساب جديد',
              tab: () {
                context.push(RegisterView(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
