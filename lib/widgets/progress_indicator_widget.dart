import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 30,
        width: 30,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.grey,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
