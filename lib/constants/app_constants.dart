import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';

class AppConstants {
  static Alice alice = Alice(showNotification: !kReleaseMode, showInspectorOnShake: true);

  /// UI
  static const Duration imageFadeInDuration = Duration(seconds: 1);
}
