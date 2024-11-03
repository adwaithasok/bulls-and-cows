import 'package:bull_cow/view/game_screen.dart';
import 'package:bull_cow/view/game_setup_screen.dart';
import 'package:bull_cow/view/home_screen.dart';
import 'package:bull_cow/view/rules_screen.dart';
import 'package:bull_cow/view/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String homeScreen = '/homeScreen';
  static const String gameScreen = '/gameScreen';
  static const String splashScreen = '/splashScreen';
  static const String gameSetupScreen = '/gameSetupScreen';
  static const String rulesScreen = '/rulesScreen';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.homeScreen:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case RouteNames.rulesScreen:
      return MaterialPageRoute(builder: (_) => RulesScreen());
    case RouteNames.gameScreen:
      return MaterialPageRoute(builder: (_) => GameScreen());
    case RouteNames.splashScreen:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case RouteNames.gameSetupScreen:
      return MaterialPageRoute(builder: (_) => GameSetupScreen());
    default:
      return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
