import 'package:domain/models/character/character_model.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters/widgets/character_information_widget.dart';
import 'package:rick_and_morty/widgets/circle_avatar_widget.dart';

class CharacterItemWidget extends StatelessWidget {
  final CharacterModel character;
  final CrossAxisAlignment characterInfoAxisAlignment;
  final EdgeInsets avatarPadding;

  const CharacterItemWidget({
    Key? key,
    required this.character,
    required this.characterInfoAxisAlignment,
    required this.avatarPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: avatarPadding,
          child: CircleAvatarWidget(
            imagePath: character.image,
            width: 74,
            height: 74,
          ),
        ),
        CharacterInformationWidget(
          character: character,
          crossAxisAlignment: characterInfoAxisAlignment,
        ),
      ],
    );
  }
}
