

         import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_widget/app_style.dart';

Widget drewDetailsProduct({cart , index}){

  return  Column(
    children: [
      Container(
          margin: EdgeInsets.only(
              left: 25.sp, top: 14.sp),
          child: Container(
            width: 170.w,
            height: 52.h,
            child: Text(
              textAlign: TextAlign.end,
              "${cart.products![index].productName.toString()}",
              style: style1Font11Weight500,
            ),
          )),
      Row(
        children: [
          cart.products![index].address == ""
              ? Text(
            textAlign: TextAlign.start,
            "لم لايوجد عنوان متاح الان",
            style:
            style1Font8Weight500,
          )
              : Text(
              "${cart.products![index].address.toString()}"),
          Image.asset(
              "assets/images/Location.png"),
        ],
      ),
      Row(
        children: [
          cart.products![index].describe == ""
              ? Text(
            " لايوجد وصف متاح الان",
            style: style1Font8Weight500,
          )
              : Container(
            width: 180.w,
            height: 20,
            child: Text(
              textAlign: TextAlign.end,
              "${cart.products![index].describe.toString()}",
              style: style1Font11Weight500.copyWith(fontSize: 8,fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
              "assets/images/Location.png"),
        ],
      ),
      Row(
        children: [
          Text(
            "${cart.products![index].price.toString()}"
                "جنية",
            style: style1Font11Weight500,
          ),
        ],
      ),
    ],
  );
}