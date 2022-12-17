import 'dart:developer' as dev;

import 'package:mommy_democracy/models/locator.dart';
import 'package:mommy_democracy/models/managers/appConfig.dart';
import 'package:mommy_democracy/models/managers/loginManager.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

class LoginPageViewModel extends BaseViewModel {
  LoginPageViewModel();

  LoginManager loginManager = locator<LoginManager>();
  PocketBase pb = PocketBase(locator<AppConfig>().pocketBaseAddress);
  RecordAuth? authUserRecord;

  Future<bool> connectWithEmailAndPassword(String email, String password) async {
    dev.log("Logging $email with password $password");
    return pb
        .collection('users')
        .authWithPassword(
          email,
          password,
        )
        .then((result) {
      authUserRecord = result;
      return true;
    }).onError((error, stackTrace) {
      dev.log("Logging returned error : $error");
      return false;
    });
  }

  //  TODO: à mettre dans le mommy manager
  Future<dynamic> getMommies() async {
    return pb
        .collection('mommies')
        .getFullList(
          batch: 200,
          sort: '-created',
        )
        .then((value) {
      print("Got mommies : $value");
      return value;
    }).onError((error, stackTrace) {
      print("We do not have mommies, error $error");
      throw Exception(error.toString());
    });
  }
}
