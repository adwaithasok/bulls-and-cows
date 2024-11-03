import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/theme/assetpath/assets_path.dart';
import 'package:bull_cow/theme/textStyle/text_styles.dart';
import 'package:bull_cow/utils/mediaquery_helper.dart';
import 'package:bull_cow/utils/sizedbox_helper.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

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
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
          width: screenWidth,
          decoration:
              const BoxDecoration(gradient: AppColors.gradientBackground),
          child: Stack(
            children: [
              Positioned(
                left: -10,
                top: screenHeight * 0.43,
                child: Image.asset(
                  AssetPaths.bullillustration,
                  width: screenWidth * 0.5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PredefinedSizedBox.large,
                  PredefinedSizedBox.large,
                  PredefinedSizedBox.large,
                  Text(
                    'BULLS',
                    style: AppTextStyles.boldPrimaryText.copyWith(
                      fontSize: 100,
                      fontFamily: FontFamily.Chewy,
                    ),
                  ),
                  Text(
                    'AND',
                    style: AppTextStyles.boldPrimaryText.copyWith(
                      fontSize: 15,
                      fontFamily: FontFamily.Chewy,
                      color: AppColors.softYellow,
                    ),
                  ),
                  Text(
                    'COWS',
                    style: AppTextStyles.boldPrimaryText.copyWith(
                      fontSize: 100,
                      fontFamily: FontFamily.Chewy,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipPath(
                        clipper: CurvedTopClipper(),
                        child: Container(
                          width: screenWidth,
                          height: screenHeight * 0.8,
                          color: AppColors.white,
                          child: Stack(
                            children: [
                              // Positioned(
                              //   left: -10,
                              //   bottom: 50,
                              //   child: Image.asset(
                              //     AssetPaths.cowIllustration,
                              //     width: screenWidth * 0.20,
                              //   ),
                              // ),
                              Positioned(
                                top: 120,
                                right: 0,
                                left: 0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SECRET GAME',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.boldBlackText
                                            .copyWith(
                                          fontFamily: FontFamily.merriWeather,
                                          fontSize: 15,
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      PredefinedSizedBox.medium,
                                      GestureDetector(
                                        onTap: () {
                                          OneContext().pushNamed(
                                              RouteNames.gameSetupScreen);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 80,
                                              right: 80,
                                              top: 20,
                                              bottom: 20),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)),
                                              gradient:
                                                  AppColors.gradientButton),
                                          child: const Text(
                                            'PLAY',
                                            style: TextStyle(
                                                fontFamily: FontFamily.Chewy,
                                                color: AppColors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: -100,
                                child: Image.asset(
                                  AssetPaths.cowillustrationright,
                                  width: screenWidth * 0.6,
                                ),
                              ),
                              // Positioned(
                              //   bottom: -10,
                              //   right: 0,
                              //   child: Image.asset(
                              //     AssetPaths.bottomillustration,
                              //     width: screenWidth,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 100);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 100);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
