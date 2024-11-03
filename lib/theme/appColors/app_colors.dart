import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffE74C3C);
  static const Color darkBlue = Color(0xff003A70);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkGray = Color(0xff4A4A4A);
  static const Color lightGray = Color.fromARGB(255, 230, 224, 226);
  static const Color softYellow = Color(0xffF1C40F);
  static const Color softRed = Color(0xffE74C3C);
  static const Color lightred = Color.fromARGB(255, 250, 151, 141);
  static const Color vilote = Color.fromARGB(255, 62, 23, 126);

  static const LinearGradient gradientBackground = LinearGradient(
    colors: [
      vilote,
      softRed,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient gradientButton = LinearGradient(
    colors: [
      Color.fromARGB(255, 252, 122, 53),
      Color.fromARGB(255, 135, 12, 39),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
