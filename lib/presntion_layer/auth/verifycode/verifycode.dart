import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/register/register_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

import '../../../shared_widget/app_style.dart';
import '../login/login_view.dart';
import '../widget_auth/drew_any_from_field.dart';


class VerifyCodeView extends StatefulWidget {
  var phone;

  VerifyCodeView({Key? key, this.phone}) : super(key: key);

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  bool _isAvailableResend = false;
  final CountDownController _controller = CountDownController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraint) {
      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //    mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 14),
                            child: Text(
                              "قم بتفعيل حسابك",
                              style:style1Font14Weight400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 14),
                            child: Text(
                                "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                                // maxLines: 2,
                                style: GoogleFonts.tajawal(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 14),
                            child: Text(
                              "${widget.phone}",
                              style: style1Font14Weight400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //
                    children: [
                      Column(
                        children: [
                          //     DrewAnyTextAuth.drewTextTwo(name: "يمكنك تسجيل الدخول الأن")
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/amico.jpg"),
                      drewAnyTextFromField(
                        icon: Icon(Icons.email_outlined),
                        valid: "ادخال الهاتف",
                        hint: "البريد الاكترونى",
                        myController: context.read<RegisterCubit>().verifyControoler, context: context,
                      ),
                      drewAnyTextFromField(
                        icon: Icon(Icons.email_outlined),
                        valid: "كلمة المرور الجديدة",
                        hint: "كلمة المرور الجديدة",
                        myController: context.read<RegisterCubit>().verifyControolerPass,
                        context: context,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Pinput(
                                length: 6,
                                keyboardType: TextInputType.number,
                                controller: context
                                    .watch<RegisterCubit>()
                                    .verifyController,
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                validator: (s) {
                                  print('validating code: $s');
                                },
                                onCompleted: null,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: HexColor("#4C8613")),
                          width: 343,
                          height: 60,
                          child: Center(
                            child: Text(
                              "تأكيد الكود",
                              style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: HexColor("#FFFFFF"),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await context
                              .read<RegisterCubit>()
                              .verifySendData(context: context);
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 1, top: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Text(
                                    "لم تستلم الكود؟",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 19,
                                        //    color: HexColor("#4C8613"),
                                        fontWeight: FontWeight.w300),
                                  ),
                                  onTap: () {
                                    //             context.push(RegisterView());
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            CircularCountDownTimer(
                              width: 50,
                              height: 50,
                              isReverse: true,
                              duration: 30,
                              controller: _controller,
                              fillColor: Colors.white54,
                              ringColor: Colors.grey,
                              initialDuration: 0,
                              onComplete: () {
                                print("=-=--=-==--=complete");
                                setState(() {
                                  _isAvailableResend = true;
                                });
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            if (_isAvailableResend == true)
                              Container(
                                width: 133.w,
                                height: 47.h,
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.white, width: 1.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      print("-=-=--=-=-=-=${widget.phone}");
                                      _controller.restart(duration: 30);
                                      setState(() {
                                        _isAvailableResend = false;
                                      });
                                    },
                                    child: Text(
                                      "resend",
                                      style: const TextStyle(
                                          color: Colors.teal, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              margin: const EdgeInsets.all(30),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: Text(
                                      "تسجيل الدخول",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 16,
                                          // color: HexColor("#4C8613"),
                                          fontWeight: FontWeight.w300),
                                    ),
                                    onTap: () {
                                      context.push(const LoginView(), context);
                                    },
                                  ),
                                  Text(
                                    " لديك حساب بالفعل ",
                                    style: GoogleFonts.tajawal(
                                        color: HexColor("#4C8613"),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ])),
          ));
    });
  }

  String drewFalg() {
    String countryCode = "sa";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
