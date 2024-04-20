import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drewDrawerAndLogo({scaffoldKey}) {
  return Row(
    children: [
      Image.asset(
        "assets/images/logo 1.jpg",
        width: 100.w,
      ),
      SizedBox(
          width: 80.w,
          child: //imgae=> drawer
              InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Image.asset("assets/images/Group 33678.png"))),
    ],
  );
}
