import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/address/address_cubit.dart';
import 'package:hoper/busines_logic_layer/cart/cart_cubit.dart';
import 'package:hoper/busines_logic_layer/cart/cart_state.dart';
import 'package:hoper/busines_logic_layer/chat/chat_cubit.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_cubit.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_state.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/busines_logic_layer/local_cubit/global_state.dart';
import 'package:hoper/busines_logic_layer/order/order_cubit.dart';
import 'package:hoper/busines_logic_layer/pages/pages_cubit.dart';
import 'package:hoper/busines_logic_layer/payment/payment_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_state.dart';
import 'package:hoper/busines_logic_layer/register/register_cubit.dart';
import 'package:hoper/busines_logic_layer/register/register_state.dart';
import 'package:hoper/busines_logic_layer/upload_images/upload_images_cubit.dart';
import 'package:hoper/presntion_layer/splashview.dart';

import 'busines_logic_layer/local_cubit/global_cubit.dart';
import 'helper/app_locale.dart';
import 'helper/di/di.dart';

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
          BlocProvider(create: (context) => CartCubit(CartState.success())),
          BlocProvider(create: (context) => PaymentCubit()),
          BlocProvider(create: (context) => PagesCubit()),
          BlocProvider(create: (context) => UploadImagesCubit()),
          BlocProvider(create: (context) => OrderCubit()),
          BlocProvider(create: (context) => ChatCubit()),
          BlocProvider(create: (context) => AddressCubit()),
          BlocProvider(create: (context) => AddressCubit()),
    BlocProvider(
    create: (context) =>GlobalCubit(),
    ),
          BlocProvider(
              create: (context) => RegisterCubit(RegisterState.initial())),
          //   BlocProvider(create: (context) => InternetCubit()..checkconnection())
        ],
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate
              ],
              supportedLocales: const [
                Locale('ar', "EG"),
                Locale('en', "US"),
              ],
              builder: DevicePreview.appBuilder,
              locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
              debugShowCheckedModeBanner: false,
              home: SplashView(),
            );
          },
        ),
      ),
    );
  }
}
