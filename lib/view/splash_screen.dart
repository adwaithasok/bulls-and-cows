import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/theme/textStyle/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      OneContext().pushNamed(RouteNames.rulesScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'Bulls and Cows',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: FontFamily.Chewy),
        ),
      ),
    );
  }
}
