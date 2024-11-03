import 'package:bull_cow/main.dart';
import 'package:bull_cow/view/home_screen.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String player1Name;
  final String player2Name;
  final String player1SecretNumber;
  final String player2SecretNumber;

  GameScreen({
    required this.player1Name,
    required this.player2Name,
    required this.player1SecretNumber,
    required this.player2SecretNumber,
  });

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentPlayerIndex = 0; // 0 for player1, 1 for player2
  String currentGuess = '';
  String feedback = '';
  bool isGameActive = true;

  @override
  Widget build(BuildContext context) {
    String currentPlayer =
        currentPlayerIndex == 0 ? widget.player1Name : widget.player2Name;
    String opponentSecret = currentPlayerIndex == 0
        ? widget.player2SecretNumber
        : widget.player1SecretNumber;

    return Scaffold(
      appBar: AppBar(title: Text('$currentPlayer\'s Turn')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter your guess'),
              onChanged: (value) {
                currentGuess = value;
              },
            ),
            ElevatedButton(
              onPressed: isGameActive
                  ? () {
                      if (currentGuess.length == 4 &&
                          isUniqueDigits(currentGuess)) {
                        var result =
                            evaluateGuess(currentGuess, opponentSecret);
                        setState(() {
                          feedback =
                              '${result.bulls} Bulls, ${result.cows} Cows';
                          if (result.bulls == 4) {
                            isGameActive = false;
                            showWinnerDialog(currentPlayer);
                          } else {
                            currentPlayerIndex =
                                1 - currentPlayerIndex; // Switch players
                          }
                        });
                      }
                    }
                  : null,
              child: Text('Submit Guess'),
            ),
            SizedBox(height: 20),
            Text(feedback, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  void showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Winner!'),
        content: Text('$winner has won the game!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  bool isUniqueDigits(String number) {
    return number.split('').toSet().length == number.length;
  }

  Result evaluateGuess(String guess, String secret) {
    int bulls = 0;
    int cows = 0;

    // Create lists to track matched positions
    List<bool> secretMatched = List.filled(4, false);
    List<bool> guessMatched = List.filled(4, false);

    List<String> secretList = secret.split('');
    List<String> guessList = guess.split('');

    // Count bulls
    for (int i = 0; i < 4; i++) {
      if (guessList[i] == secretList[i]) {
        bulls++;
        secretMatched[i] = true; // Mark as matched
        guessMatched[i] = true; // Mark as matched
      }
    }

    // Count cows
    for (int i = 0; i < 4; i++) {
      if (!guessMatched[i]) {
        for (int j = 0; j < 4; j++) {
          if (!secretMatched[j] && guessList[i] == secretList[j]) {
            cows++;
            secretMatched[j] = true; // Mark as matched
            break; // Break to avoid counting the same guess for multiple cows
          }
        }
      }
    }

    return Result(bulls, cows);
  }
}

class Result {
  final int bulls;
  final int cows;

  Result(this.bulls, this.cows);
}
