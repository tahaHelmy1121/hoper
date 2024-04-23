import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/helper/cache_helper.dart';
import 'package:hoper/shared_widget/drew_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/di/di.dart';
import 'auth/login/login_view.dart';

import 'home/home_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  getCustomerTypeNav(BuildContext context) async {
   var customer =    sl<CacheHelper>().getData(key: "name");
    if (customer == null || customer == 0) {
      Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.pushAndRemoveUntil(context,
                PageRouteBuilder(pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const LoginView(),
                  );
                }), (route) => false),
      );
    }else{
      Timer(
        const Duration(seconds: 3),
            () =>
                Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context,animation,_) {
              return FadeTransition(
                opacity: animation,
                child:   CustomNavBar(),
              );
            }), (route) => false),

      );
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getCustomerTypeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,BoxConstraints boxConstraint) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 320.sp),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:ExactAssetImage("assets/images/logo.png")
                  )
                ),
                width: 400.w,
                height:50.h,
                child: Column(
                  children: [
                  ],
                ),
              ),
              CircularProgressIndicator(color: Colors.green,)
            ],
          ),
        ),
      );
    });
  }
}
