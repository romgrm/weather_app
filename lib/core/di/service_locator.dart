import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/storage/secure_storage_impl.dart';
import 'package:weather_app/dataLayer/datasources/authentication.data.dart';
import 'package:weather_app/dataLayer/datasources/authentication_impl.data.dart';
import 'package:weather_app/dataLayer/datasources/weather.data.dart';
import 'package:weather_app/dataLayer/datasources/weather_impl.data.dart';

import '../rest/restManager.dart';
import '../storage/storage.manager.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  // Http Client
  getIt.registerSingleton<Dio>(Dio());

  // Storage Manager
  getIt.registerSingleton<StorageManager>(StorageManager(SecureStorageImpl(const FlutterSecureStorage())));

  // Authentication & REST
  getIt.registerLazySingleton<RestManager>(() => RestManager(dio: getIt<Dio>()));

  // Datasources
  getIt.registerFactory<AuthenticationDataSource>(() => AuthenticationDataSourceImpl(getIt<RestManager>()));
  getIt.registerFactory<WeatherDataSourceImpl>(() => WeatherDataSourceImpl(getIt<RestManager>()));
}
