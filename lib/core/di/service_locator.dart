import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../rest/restManager.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
// Http Client
  getIt.registerSingleton<Dio>(Dio());

  // Authentication & REST
  getIt.registerLazySingleton<RestManager>(() => RestManager(dio: getIt<Dio>()));
}
