import 'package:bull_cow/provider/game_setup_provider.dart';
import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:one_context/one_context.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameSetupProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
      ),
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: generateRoute,
    );
  }
}
