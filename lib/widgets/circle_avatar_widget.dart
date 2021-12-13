import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/app_constants.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;

  const CircleAvatarWidget({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imagePath,
        height: height,
        width: width,
        fadeInDuration: AppConstants.imageFadeInDuration,
      ),
    );
  }
}
