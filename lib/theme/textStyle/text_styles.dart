import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle boldBlackText = TextStyle(
    color: AppColors.black,
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle boldPrimaryText = TextStyle(
    color: AppColors.white,
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.bold,
  );
}

class FontFamily {
  static const merriWeather = 'merriweather';
  static const Chewy = 'Chewy';
  static const montserrat = 'montserrat';
}
