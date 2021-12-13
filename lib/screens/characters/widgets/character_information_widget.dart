import 'package:domain/enums/characters/gender.dart';
import 'package:domain/models/character/character_model.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_strings.dart';
import 'package:rick_and_morty/resources/app_text_styles.dart';
import 'package:rick_and_morty/widgets/character/character_status_widget.dart';

class CharacterInformationWidget extends StatelessWidget {
  final CharacterModel character;
  final CrossAxisAlignment crossAxisAlignment;

  const CharacterInformationWidget({
    Key? key,
    required this.character,
    required this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CharacterStatusWidget(status: character.status),
        Text(character.name, style: AppTextStyles.blackMajorMediumText),
        Text('${character.species}, ${_getGender()}', style: AppTextStyles.greyText),
      ],
    );
  }

  String _getGender() {
    switch (character.gender) {
      case Gender.female:
        return AppStrings.female;
      case Gender.male:
        return AppStrings.male;
      case Gender.genderless:
        return AppStrings.genderless;
      case Gender.unknown:
        return AppStrings.unknown;
    }
  }
}
