import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../busines_logic_layer/chat/chat_cubit.dart';
import '../../../shared_widget/app_style.dart';

Widget drewFormChat({required BuildContext context, Function()? onTap}) {
  return Container(
    alignment: Alignment.center,
    width: 327.w,
    child: Container(
      width: 327.w,
      height: 72.h,
      child: TextFormField(
        textAlign: TextAlign.end,
        controller: context.read<ChatCubit>().textEditingController,
        minLines: 4,
        maxLines: 6,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          hintText: "ارسل رسالة ",
          hintStyle:
              style16Font18Weight800eint.copyWith(color: HexColor("#49B673")),
          prefixIcon: InkWell(
            onTap: onTap,
            child: Container(
              child: Image.asset("assets/images/Paperfly.png"),
              margin: EdgeInsets.only(left: 8.sp),
              decoration: BoxDecoration(
                  color: HexColor("#49B673"),
                  borderRadius: BorderRadius.circular(50)),
              width: 50,
              height: 50,
            ),
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
  );
}
