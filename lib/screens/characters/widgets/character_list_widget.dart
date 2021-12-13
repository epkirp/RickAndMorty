import 'package:domain/models/character/character_model.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters/widgets/character_item_widget.dart';

class CharacterListWidget extends StatelessWidget {
  final List<CharacterModel> characters;

  const CharacterListWidget({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: [
              CharacterItemWidget(
                character: characters[index],
                characterInfoAxisAlignment: CrossAxisAlignment.start,
                avatarPadding: const EdgeInsets.only(right: 18),
              ),
              const SizedBox(height: 24)
            ],
          );
        },
        childCount: characters.length,
      ),
    );
  }
}
