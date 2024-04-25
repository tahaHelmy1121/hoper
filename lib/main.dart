import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'busines_logic_layer/local_cubit/global_cubit.dart';
import 'firebase_options.dart';
import 'helper/cache_helper.dart';
import 'helper/di/di.dart';
import 'hoper_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(

      DevicePreview(
          enabled: true,
          builder: (context) {
            return BlocProvider(
              create: (context) => sl<GlobalCubit>(),
              child: HoperApp(),
            );
          }
      ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
