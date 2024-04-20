import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/address/address_cubit.dart';
import 'package:hoper/busines_logic_layer/cart/cart_cubit.dart';
import 'package:hoper/busines_logic_layer/cart/cart_state.dart';
import 'package:hoper/busines_logic_layer/chat/chat_cubit.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_cubit.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_state.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/busines_logic_layer/order/order_cubit.dart';
import 'package:hoper/busines_logic_layer/pages/pages_cubit.dart';
import 'package:hoper/busines_logic_layer/payment/payment_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_state.dart';
import 'package:hoper/busines_logic_layer/register/register_cubit.dart';
import 'package:hoper/busines_logic_layer/register/register_state.dart';
import 'package:hoper/busines_logic_layer/upload_images/upload_images_cubit.dart';
import 'package:hoper/presntion_layer/auth/login/login_view.dart';

import 'package:hoper/presntion_layer/splashview.dart';

class HoperApp extends StatelessWidget {
  const HoperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => FavouriteCubit(FavouriteState.initial())),
          BlocProvider(create: (context) => HomeCubit(HomeState.success())),
          BlocProvider(
              create: (context) => ProfileCubit(ProfileState.success())),
          BlocProvider(
              create: (context) => CartCubit(CartState.success())),
          BlocProvider(
              create: (context) => PaymentCubit()),
          BlocProvider(
              create: (context) => PagesCubit()),
          BlocProvider(
              create: (context) => UploadImagesCubit()),
          BlocProvider(
              create: (context) => OrderCubit()),
          BlocProvider(
              create: (context) => ChatCubit()),
          BlocProvider(
              create: (context) => AddressCubit()),
          BlocProvider(
              create: (context) => AddressCubit()),
          BlocProvider(
              create: (context) => RegisterCubit(RegisterState.initial())),
       //   BlocProvider(create: (context) => InternetCubit()..checkconnection())
        ],
        child: MaterialApp(

          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ),
      ),
    );
  }
}
