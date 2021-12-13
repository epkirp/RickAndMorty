import 'package:domain/entities/character/character_entity.dart';
import 'package:domain/enums/characters/character_status.dart';
import 'package:domain/enums/constants/enum_constants.dart';
import 'package:domain/enums/characters/gender.dart';

class CharacterModel {
  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final Gender gender;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.createModelFromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: _getStatusByName(entity.status),
      species: entity.species,
      gender: _getGenderByName(entity.gender),
      image: entity.image,
    );
  }

  static Gender _getGenderByName(String genderName) {
    switch (genderName) {
      case EnumConstants.female:
        return Gender.female;

      case EnumConstants.male:
        return Gender.male;

      case EnumConstants.genderless:
        return Gender.genderless;

      case EnumConstants.unknown:
        return Gender.unknown;

      default:
        throw Exception('Gender $genderName not found');
    }
  }

  static CharacterStatus _getStatusByName(String statusName) {
    switch (statusName) {
      case EnumConstants.alive:
        return CharacterStatus.alive;

      case EnumConstants.dead:
        return CharacterStatus.dead;

      case EnumConstants.unknown:
        return CharacterStatus.unknown;

      default:
        throw Exception('Character status $statusName not found');
    }
  }
}
