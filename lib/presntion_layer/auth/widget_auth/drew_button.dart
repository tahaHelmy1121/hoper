


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/login/login_cubit.dart';

Widget drewCustomButton({required BuildContext context,email , pass , name ,required Function()?on}){
  return     InkWell(
    onTap: on,
      child:
      Container(
        width: 278.w,
        height: 63.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#49B673")),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
        ),
  )
  );
}
