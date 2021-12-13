import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_colors.dart';
import 'package:rick_and_morty/resources/app_icons.dart';
import 'package:rick_and_morty/resources/app_strings.dart';
import 'package:rick_and_morty/screens/bottom_navigation/widgets/app_bottom_navigation_bar_item.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.teal,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 10,
      selectedFontSize: 10,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        AppBottomNavigationBarItem(
          iconPath: AppIcons.character,
          itemLabel: AppStrings.characters,
        ),
        AppBottomNavigationBarItem(
          iconPath: AppIcons.location,
          itemLabel: AppStrings.locations,
        ),
        AppBottomNavigationBarItem(
          iconPath: AppIcons.episode,
          itemLabel: AppStrings.episodes,
        ),
        AppBottomNavigationBarItem(
          iconPath: AppIcons.settings,
          itemLabel: AppStrings.settings,
        ),
      ],
      currentIndex: currentIndex,
      onTap: (newSelectedTab) => onTap(newSelectedTab),
    );
  }
}
