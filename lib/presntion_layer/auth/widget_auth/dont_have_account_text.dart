import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/auth/login/login_view.dart';
import 'package:hoper/presntion_layer/auth/register_view/register_view.dart';
import 'package:hoper/shared_widget/app_style.dart';


class DontHaveAccountText extends StatelessWidget {
 final String textSpan ;
  final String TextRich;
  void Function()tab;
   DontHaveAccountText({super.key, required this.textSpan, required this.TextRich ,required this.tab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:tab,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: textSpan,
              style: style1Font12Weight500Heint,
            ),
            TextSpan(
              text: TextRich,
              style: style1Font14Weight400.copyWith(color:HexColor("#49B673")),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
              //    context.pushReplacementNamed(Routes.signUpScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}