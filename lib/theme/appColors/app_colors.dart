import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xff19224B);
  static const Color lightBlue = Color(0xff4A90E2);
  static const Color teal = Color(0xff50E3C2);
  static const Color darkBlue = Color(0xff003A70);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkGray = Color(0xff4A4A4A);
  static const Color softYellow = Color(0xffF1C40F);
  static const Color softRed = Color(0xffE74C3C);

  // Gradient Colors
  static const LinearGradient gradientBackground = LinearGradient(
    colors: [
      lightBlue,
      teal,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class GradientColors {}

class MyShimmerColor {
  static Color shimmerColor = Colors.grey[300]!;
  static Color highlightColor = const Color.fromARGB(255, 255, 251, 251);
}
