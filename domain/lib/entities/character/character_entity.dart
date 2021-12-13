import 'package:json_annotation/json_annotation.dart';

part 'character_entity.g.dart';

@JsonSerializable()
class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) => _$CharacterEntityFromJson(json);
}
