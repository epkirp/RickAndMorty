import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(AppStrings.settings),
      ),
    );
  }
}
