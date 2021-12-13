import 'package:flutter/material.dart';

class AppNavigator {
  /// Common

  static _pushAndRemoveUntilPage(BuildContext context, Widget page) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  static _pushToPage(BuildContext context, Widget page,
      {bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

// /// Bottom navigation screen
// static navigateToBottomNavigation(BuildContext context) {
//   _pushAndRemoveUntilPage(
//     context,
//     BlocProvider(
//       create: (_) => BottomNavigationBloc(),
//       child: const BottomNavigationScreen(),
//     ),
//   );
// }
}
