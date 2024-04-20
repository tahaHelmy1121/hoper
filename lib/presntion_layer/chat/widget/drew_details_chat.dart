

         import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared_widget/app_style.dart';

Widget drewDetailsChat({chat}){
  return  Container(
    child: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(12.sp),
                      child: Text(
                        textAlign: TextAlign.right,
                        "${chat[index].message}",
                        style: style1Font18Weight500eint,
                      ),
                    ),
                    margin: EdgeInsets.all(14.sp),
                    width: 279.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(14.sp),
                    child: Container(
                      margin: EdgeInsets.all(12.sp),
                      child: Text(
                        textAlign: TextAlign.left,
                        "${chat[index].msgType}",
                        style: style16Font18Weight800eint,
                      ),
                    ),
                    width: 302.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                        color: HexColor("#3C4042"),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        )),
                  )
                ],
              ),
            ],
          );
        }),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.circular(20),
      color: HexColor("#F5F4F8"),
    ),
    margin: EdgeInsets.only(top: 20.sp),
    width: 450.w,
    height: 650.h,
  );
}