import 'package:json_annotation/json_annotation.dart';

part 'mommyDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class Mommy {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'pictureUrl')
  String pictureUrl;

  Mommy({required this.id, required this.name, required this.pictureUrl});

  factory Mommy.fromJson(Map<String, dynamic> json) => Mommy.fromJson(json);

  Map<String, dynamic> toJson() => _$MommyToJson(this);
}
