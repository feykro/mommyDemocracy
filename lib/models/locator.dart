import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mommy_democracy/models/managers/appConfig.dart';
import 'package:mommy_democracy/models/managers/loginManager.dart';
import 'package:mommy_democracy/models/managers/requestManager.dart';

final locator = GetIt.instance;
const pocketBaseAddress = "http://127.0.0.1:8090";

void setupLocator() {
  locator.registerSingleton<LoginManager>(LoginManager());
  locator.registerSingleton<RequestManager>(RequestManager(
    baseApiUrl: "http://127.0.0.1:8090/api/",
    dio: Dio(),
  ));
  locator.registerSingleton<AppConfig>(AppConfig(pocketBaseAddress: pocketBaseAddress));
}
