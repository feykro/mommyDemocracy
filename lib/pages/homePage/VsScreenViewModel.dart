import 'dart:developer';

import 'package:mommy_democracy/models/locator.dart';
import 'package:mommy_democracy/models/managers/appConfig.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

class VsScreenViewModel extends BaseViewModel {
  List<RecordModel>? mommies;
  PocketBase pb = PocketBase(locator<AppConfig>().pocketBaseAddress);

  //  TODO: get a versus id and stuff
  void initMommies() async {
    await Future.delayed(Duration(seconds: 2));
    await pb
        .collection('mommies')
        .getFullList(
          batch: 200,
          sort: '-created',
        )
        .then((value) {
      log("Got mommies : $value");
      mommies = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("We do not have mommies, error $error");
      throw Exception(error.toString());
    });
  }
}
