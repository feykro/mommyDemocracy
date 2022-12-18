import 'package:json_annotation/json_annotation.dart';

part 'mommyBattleDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class MommyBattle {
  // @JsonKey(name: 'id')
  // String id;

  @JsonKey(name: 'mommy1_id')
  String mommy1Id;

  @JsonKey(name: 'mommy2_id')
  String mommy2Id;

  @JsonKey(name: 'mommy1_votes')
  int mommy1Votes;

  @JsonKey(name: 'mommy2_votes')
  int mommy2Votes;

  @JsonKey(name: 'battle_start')
  DateTime battleStart;

  @JsonKey(name: 'batlle_end')
  DateTime? battleEnd;

  MommyBattle(
      {required this.mommy1Id,
      required this.mommy2Id,
      required this.mommy1Votes,
      required this.mommy2Votes,
      required this.battleStart,
      this.battleEnd});

  factory MommyBattle.fromJson(Map<String, dynamic> json) => _$MommyBattleFromJson(json);

  Map<String, dynamic> toJson() => _$MommyBattleToJson(this);
}
