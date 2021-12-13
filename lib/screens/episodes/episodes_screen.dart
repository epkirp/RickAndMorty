import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_strings.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(AppStrings.episodes),
      ),
    );
  }
}
