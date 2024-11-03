import 'package:bull_cow/routes/routes.dart';
import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:bull_cow/utils/mediaquery_helper.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHelper = MediaQueryHelper();
    double screenWidth = mediaQueryHelper.screenWidth;
    double screenHeight = mediaQueryHelper.screenHeight;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Game Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _RuleItem(
                          icon: Icons.format_list_numbered,
                          rule: 'Each player chooses a unique 4-digit number.',
                        ),
                        _RuleItem(
                          icon: Icons.sync,
                          rule:
                              'Players take turns guessing the opponent\'s number.',
                        ),
                        _RuleItem(
                          icon: Icons.check,
                          rule:
                              'The number of bulls (correct digits in the correct position) and cows (correct digits in the wrong position) is given as feedback.',
                        ),
                        _RuleItem(
                          icon: Icons.emoji_events,
                          rule:
                              'The first player to guess the opponent\'s number wins.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  width: screenWidth,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        OneContext().pushNamed(RouteNames.homeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RuleItem extends StatelessWidget {
  final IconData icon;
  final String rule;

  const _RuleItem({
    Key? key,
    required this.icon,
    required this.rule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              rule,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
