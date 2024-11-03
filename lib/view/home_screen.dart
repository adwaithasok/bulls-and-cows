import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/utils/mediaquery_helper.dart';
import 'package:bull_cow/view/game_setup_screen.dart';
import 'package:bull_cow/view/rules_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHelper = MediaQueryHelper();
    double screenWidth = mediaQueryHelper.screenWidth;
    double screenHeight = mediaQueryHelper.screenHeight;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => GameSetupScreen()));
                },
                child: const Text('Start Game'),
              ),
              // Uncomment and add more buttons or widgets as needed
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (_) => RulesScreen()));
              //   },
              //   child: Text('Rules'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
