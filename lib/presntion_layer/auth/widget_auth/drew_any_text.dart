

           import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoper/shared_widget/app_style.dart';

Widget drewAnyText({name }){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          margin: EdgeInsets.only(right: 18),
          child: Text(
            name,
            style: style1Font20Weight400
          )),
    ],
  );
}