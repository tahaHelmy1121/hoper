


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/login/login_cubit.dart';

import '../../../shared_widget/app_style.dart';
import '../../../shared_widget/custom_text_form_field.dart';

Widget drewAnyTextFromField({required BuildContext context , myController , hint, valid , icon,pIcon ,}){
return Column(
  children: [
    SizedBox(
        width: 327.w,
        height: 70.h,
        child: AppTextFormField(
          controller: myController,
          hentStyle: style1Font12Weight500Heint,
          suffixIcon: icon,
          pIcon: pIcon,
          hintText: hint,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return valid;
            }
          },
        )),
    SizedBox(
      height: 12.sp,
    ),
  ],
);
}