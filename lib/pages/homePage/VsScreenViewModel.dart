import 'dart:developer' as dev;

import 'package:mommy_democracy/models/DTO/mommyBattleDTO.dart';
import 'package:mommy_democracy/models/DTO/mommyDTO.dart';
import 'package:mommy_democracy/models/locator.dart';
import 'package:mommy_democracy/models/managers/appConfig.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:stacked/stacked.dart';

//  TODO: clean the code
//  TODO: let user vote every 5sec
//  TODO: subscribe to votes and update bar on the side
class VsScreenViewModel extends BaseViewModel {
  List<RecordModel>? mommies;
  Mommy? mommy1;
  Mommy? mommy2;
  MommyBattle? currentBattle;
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
      dev.log("Got mommies : $value");
      mommies = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      dev.log("We do not have mommies, error $error");
      throw Exception(error.toString());
    });
  }

  void initCurrentBattle() async {
    await Future.delayed(Duration(seconds: 2));

    final battleResponse = await pb.collection('mommyBattle').getFullList(
          batch: 1,
          sort: '-battle_start',
        );
    dev.log("Got response : $battleResponse");
    if (battleResponse.isNotEmpty) {
      dev.log("First item of response is: ${battleResponse.first.data}");
      currentBattle = MommyBattle.fromJson(battleResponse.first.data);
      if (currentBattle != null) {
        mommy1 = await getMommy(currentBattle!.mommy1Id);
        mommy2 = await getMommy(currentBattle!.mommy2Id);
      }
      notifyListeners();
    }
    dev.log("Init current battle as : $currentBattle");
  }

  //  TODO : fonction from RecordModel to Mommy
  Future<Mommy?> getMommy(String mommyId) async {
    return pb.collection('mommies').getOne(mommyId).then((value) {
      dev.log("got mommy with id $mommyId : $value");
      Map<String, dynamic> json = value.toJson();
      return Mommy(id: json["id"], name: json["name"], pictureUrl: json["pictureUrl"]);
    });
  }
}
