import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/app_constants.dart';
import 'package:rick_and_morty/resources/app_strings.dart';
import 'package:rick_and_morty/screens/bottom_navigation/bottom_navigation_screen.dart';

class Application extends StatelessWidget {
  final GlobalKey<NavigatorState> _globalKey;

  const Application({Key? key, required GlobalKey<NavigatorState> globalKey})
      : _globalKey = globalKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConstants.alice.setNavigatorKey(_globalKey);

    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(primaryColor: Colors.white),
      navigatorKey: _globalKey,
      home: const BottomNavigationScreen(),
    );
  }
}
