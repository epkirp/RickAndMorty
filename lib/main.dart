import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/application.dart';
import 'package:rick_and_morty/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setInjections();

  // todo разобраться с этой функцией
  runZonedGuarded(() {
    runApp(Application(globalKey: GlobalKey<NavigatorState>()));
  }, (Object error, StackTrace stackTrace) {
    // Nothing
  });
}
