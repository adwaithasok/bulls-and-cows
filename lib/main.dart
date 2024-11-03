import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/view/home_screen.dart';
import 'package:bull_cow/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:one_context/one_context.dart';

void main() {
  // Get.put(GalleryImageController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Seekers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
      ),
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      initialRoute: RouteNames.SplashScreen,
      routes: {
        RouteNames.SplashScreen: (context) => SplashScreen(),
        RouteNames.HomeScreen: (context) => HomeScreen(),
      },
    );
  }
}
