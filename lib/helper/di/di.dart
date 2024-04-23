
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../cache_helper.dart';


final sl = GetIt.instance;
void initServiceLoactor(){
  sl.registerLazySingleton(()=> CacheHelper());


}