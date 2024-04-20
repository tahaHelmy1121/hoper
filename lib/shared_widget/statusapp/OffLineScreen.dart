import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../app_style.dart';

class OffLineScreen extends StatelessWidget {
  const OffLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              height: 250.h,
              width: 250.w,
              child: Column(
                children: [
                  Lottie.asset("assets/lotti/wifi.json"),
                  SizedBox(height: 18.h,),
                  Text(
                    "please Check Internet Your Mobile Or Wifi",
                    style:style1Font25Weight500.copyWith(fontSize: 18,),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
