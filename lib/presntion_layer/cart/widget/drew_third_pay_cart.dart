import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_widget/app_style.dart';

Widget drewPayCartTotal({cart}){
  return Container(
    child: Container(
      margin: EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 14.sp),
                  child: Text(
                    "${cart.fullTotal.toString()}",
                    style: style1Font14Weight400,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 14.sp),
                  child: Text(
                    " اجمالى السلة",
                    style: style1Font14Weight400,
                  )),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 7.sp),
                  child: Text(
                    "${cart.shippingCost.toString()}",
                    style: style1Font14Weight400,
                  )),
              Container(
                  margin: EdgeInsets.only(right: 7.sp),
                  child: Text(
                    " الخصم",
                    style: style1Font14Weight400,
                  )),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 7.sp),
                  child: Text(
                    "${cart.totalCart.toString()}",
                    style: style1Font14Weight400,
                  )),
              Container(
                  margin: EdgeInsets.only(right: 4.sp),
                  child: Text(
                    " اجمالى السله بعد الخصم",
                    style: style1Font14Weight400,
                  )),
            ],
          ),
        ],
      ),
    ),
    height: 193.h,
    width: 327.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300)),
    margin: EdgeInsets.only(
      right: 14.sp,
    ),
  );
}