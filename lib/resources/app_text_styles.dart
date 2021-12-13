import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_colors.dart';

class AppTextStyles {
  static const TextStyle greenSmallMediumText = TextStyle(
    fontSize: 10,
    color: AppColors.green,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle redSmallMediumText = TextStyle(
    fontSize: 10,
    color: AppColors.red,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle greySmallMediumText = TextStyle(
    fontSize: 10,
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle blackMajorMediumText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle greyText = TextStyle(fontSize: 12, color: AppColors.grey);
}
