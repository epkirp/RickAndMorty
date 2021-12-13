import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/resources/app_colors.dart';

class AppBottomNavigationBarItem extends BottomNavigationBarItem {
  final String iconPath;
  final String itemLabel;

  AppBottomNavigationBarItem({required this.iconPath, required this.itemLabel})
      : super(
          icon: SvgPicture.asset(
            iconPath,
            color: AppColors.grey,
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            iconPath,
            color: AppColors.teal,
            width: 24,
            height: 24,
          ),
          label: itemLabel,
        );
}
