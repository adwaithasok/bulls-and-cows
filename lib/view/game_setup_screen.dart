import 'package:bull_cow/provider/game_setup_provider.dart';
import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/theme/assetpath/assets_path.dart';
import 'package:bull_cow/theme/textStyle/text_styles.dart';
import 'package:bull_cow/utils/mediaquery_helper.dart';
import 'package:bull_cow/utils/sizedbox_helper.dart';
import 'package:bull_cow/view/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

class GameSetupScreen extends StatefulWidget {
  @override
  State<GameSetupScreen> createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends State<GameSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _player1NameController = TextEditingController();
  final TextEditingController _player1SecretController =
      TextEditingController();
  final TextEditingController _player2NameController = TextEditingController();
  final TextEditingController _player2SecretController =
      TextEditingController();

  InputDecoration textFieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.black, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.darkBlue, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final setupProvider = Provider.of<GameSetupProvider>(context);
    final mediaQueryHelper = MediaQueryHelper();
    double screenWidth = mediaQueryHelper.screenWidth;
    double screenHeight = mediaQueryHelper.screenHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(
                AssetPaths.bgsetupgame,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: -10,
              bottom: 0,
              child: Image.asset(
                AssetPaths.cowIllustration,
                width: screenWidth * 0.40,
              ),
            ),
            Positioned(
              right: -50,
              bottom: 0,
              child: Image.asset(
                AssetPaths.cow,
                width: screenWidth * 0.60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                  ),
                  child: Container(
                    height: !setupProvider.isPlayer1Completed
                        ? screenHeight * 0.35
                        : screenHeight * 0.25,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!setupProvider.isPlayer1Completed) ...[
                          TextFormField(
                            keyboardType: TextInputType.name,
                            maxLength: 10,
                            controller: _player1NameController,
                            decoration: textFieldDecoration('Player 1 Name'),
                            onChanged: setupProvider.updatePlayer1Name,
                          ),
                          PredefinedSizedBox.large,
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            controller: _player1SecretController,
                            decoration:
                                textFieldDecoration('Player 1 Secret Number'),
                            obscureText: true,
                            onChanged: setupProvider.updatePlayer1SecretNumber,
                            validator: (value) {
                              if (value == null ||
                                  value.length != 4 ||
                                  !setupProvider.isUniqueDigits(value)) {
                                return 'Enter a unique 4-digit number';
                              }
                              return null;
                            },
                          ),
                          PredefinedSizedBox.large,
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [AppColors.darkBlue, AppColors.vilote],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    setupProvider.player1Name.isNotEmpty) {
                                  setupProvider.completePlayer1();
                                  _player1NameController.clear();
                                  _player1SecretController.clear();
                                }
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: FontFamily.Chewy,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                        if (setupProvider.isPlayer1Completed) ...[
                          TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.name,
                            controller: _player2NameController,
                            decoration: textFieldDecoration('Player 2 Name'),
                            onChanged: setupProvider.updatePlayer2Name,
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            controller: _player2SecretController,
                            decoration:
                                textFieldDecoration('Player 2 Secret Number'),
                            obscureText: true,
                            onChanged: setupProvider.updatePlayer2SecretNumber,
                            validator: (value) {
                              if (value == null ||
                                  value.length != 4 ||
                                  !setupProvider.isUniqueDigits(value)) {
                                return 'Enter a unique 4-digit number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            setupProvider.isPlayer1Completed
                ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: screenHeight * 0.45,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: setupProvider.isStartButtonEnabled
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  setupProvider.completePlayer1();

                                  OneContext().pushNamed(
                                    RouteNames.gameScreen,
                                  );
                                }
                              }
                            : null,
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: setupProvider.isStartButtonEnabled
                                ? const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.green, AppColors.white])
                                : const LinearGradient(
                                    colors: [Colors.grey, Colors.grey]),
                          ),
                          child: const Center(
                            child: Text(
                              'Start Game',
                              style: TextStyle(
                                fontFamily: FontFamily.Chewy,
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                : SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _player1NameController.dispose();
    _player1SecretController.dispose();
    _player2NameController.dispose();
    _player2SecretController.dispose();
    super.dispose();
  }
}
