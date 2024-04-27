import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/helper/cache_helper.dart';

import '../helper/di/di.dart';

Widget drewBackGroundColors() {
  var csutomer = sl<CacheHelper>().getData(key: "1");
  return Row(
    children: [
      csutomer == "2"
          ? Row(
              children: [
                Container(
                  height: 350.h,
                  width: 240.w,
                  decoration: BoxDecoration(
                      color: HexColor("#49B673"),
                      borderRadius: BorderRadius.only(
                        topRight:Radius.circular(80),
                        bottomRight:Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                          topLeft: Radius.circular(
                        80,
                      ))),
                ),
              ],
            )
          :    Container(
        height: 350.h,
        width: 240.w,
        decoration: BoxDecoration(
            color: HexColor("#49B673"),
            borderRadius: BorderRadius.only(
                topRight:Radius.circular(80),
                bottomRight:Radius.circular(80),
                bottomLeft: Radius.circular(80),
                topLeft: Radius.circular(
                  80,
                ))),
      ),
    ],
  );
}
