import 'package:flutter/foundation.dart'; // Import this for kIsWeb
import 'package:one_context/one_context.dart';

class MediaQueryHelper {
  double get screenWidth => OneContext().mediaQuery.size.width;

  double get screenHeight => OneContext().mediaQuery.size.height;

  double get safeAreaTop => OneContext().mediaQuery.padding.top;
  double get safeAreaBottom => OneContext().mediaQuery.padding.bottom;
  double get safeAreaLeft => OneContext().mediaQuery.padding.left;
  double get safeAreaRight => OneContext().mediaQuery.padding.right;
}
