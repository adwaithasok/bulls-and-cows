import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rules')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Rules of Bulls and Cows:\n\n'
            '1. Each player chooses a unique 4-digit number.\n'
            '2. Players take turns guessing the opponent\'s number.\n'
            '3. The number of bulls (correct digits in the correct position) and cows (correct digits in the wrong position) is given as feedback.\n'
            '4. The first player to guess the opponent\'s number wins.\n',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
