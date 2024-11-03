import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/theme/assetpath/assets_path.dart';
import 'package:bull_cow/theme/textStyle/text_styles.dart';
import 'package:bull_cow/utils/mediaquery_helper.dart';
import 'package:bull_cow/utils/sizedbox_helper.dart';
import 'package:bull_cow/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bull_cow/provider/game_setup_provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _guessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final setupProvider = Provider.of<GameSetupProvider>(context);
    final mediaQueryHelper = MediaQueryHelper();
    double screenWidth = mediaQueryHelper.screenWidth;
    double screenHeight = mediaQueryHelper.screenHeight;
    String currentPlayer = setupProvider.currentPlayerIndex == 0
        ? setupProvider.player1Name
        : setupProvider.player2Name;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              AssetPaths.bggamescreen,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 100),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(14)),
                  height: screenHeight * 0.25,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '$currentPlayer\'s Turn',
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: FontFamily.Chewy,
                            color: AppColors.white),
                      ),
                      PredefinedSizedBox.large,
                      TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.white,
                        controller: _guessController,
                        maxLength: 4,
                        decoration: const InputDecoration(
                          labelText: 'Enter your Guess',
                          labelStyle: TextStyle(color: AppColors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                        ),
                        style: const TextStyle(color: AppColors.white),
                        onChanged: (value) =>
                            setupProvider.updatePlayerGuess(value),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.black,
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  child: TextButton(
                    onPressed: setupProvider.isGameActive
                        ? () {
                            setupProvider.submitGuess(
                              setupProvider.currentPlayerIndex == 0
                                  ? setupProvider.player1Guess
                                  : setupProvider.player2Guess,
                              context,
                            );
                            _guessController.clear();
                            setupProvider.clearCurrentGuess();
                          }
                        : null,
                    child: const Text(
                      'Submit Guess',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PredefinedSizedBox.medium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      setupProvider.cow,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          AssetPaths.cowicon,
                          width: screenWidth * 0.09,
                        ),
                      ),
                    ),
                    PredefinedSizedBox.medium,
                    ...List.generate(
                      setupProvider.bull,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          AssetPaths.bull,
                          width: screenWidth * 0.08,
                        ),
                      ),
                    ),
                  ],
                ),
                if (setupProvider.cow == 0 &&
                    setupProvider.bull == 0 &&
                    setupProvider.noMatch) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'No input value match',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontFamily: FontFamily.Chewy,
                    ),
                  ),
                ],
                if (setupProvider.isGameWon) ...[
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      setupProvider.resetGame();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Restart Game'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }
}
