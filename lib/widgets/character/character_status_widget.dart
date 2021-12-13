import 'package:domain/enums/characters/character_status.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_strings.dart';
import 'package:rick_and_morty/resources/app_text_styles.dart';

class CharacterStatusWidget extends StatelessWidget {
  final CharacterStatus status;

  const CharacterStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String statusName;
    late TextStyle textStyle;

    switch (status) {
      case CharacterStatus.alive:
        statusName = AppStrings.alive;
        textStyle = AppTextStyles.greenSmallMediumText;
        break;
      case CharacterStatus.dead:
        statusName = AppStrings.dead;
        textStyle = AppTextStyles.redSmallMediumText;
        break;
      case CharacterStatus.unknown:
        statusName = AppStrings.unknown;
        textStyle = AppTextStyles.greySmallMediumText;
        break;
    }

    return Text(statusName.toUpperCase(), style: textStyle);
  }
}
