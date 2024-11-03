import 'package:bull_cow/theme/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class Result {
  final int bulls;
  final int cows;

  const Result(this.bulls, this.cows);
}

class GameSetupProvider extends ChangeNotifier {
  String _player1Name = '';
  String _player2Name = '';
  String _player1Guess = '';
  String _player2Guess = '';
  String _player1SecretNumber = '';
  String _player2SecretNumber = '';
  int _currentPlayerIndex = 0;
  String _currentGuess = '';
  String _feedback = '';
  int _cow = 0;
  int _bull = 0;
  bool _isGameActive = true;
  bool _isGameWon = false;
  bool _isPlayer1Completed = false;
  bool _isStartButtonEnabled = false;
  bool _noMatch = false;

  String get player1Name => _player1Name;
  String get player2Name => _player2Name;
  String get player1SecretNumber => _player1SecretNumber;
  String get player2SecretNumber => _player2SecretNumber;
  int get currentPlayerIndex => _currentPlayerIndex;
  String get currentGuess => _currentGuess;
  String get feedback => _feedback;
  int get cow => _cow;
  int get bull => _bull;
  bool get isGameActive => _isGameActive;
  bool get isGameWon => _isGameWon;
  bool get isPlayer1Completed => _isPlayer1Completed;
  bool get isStartButtonEnabled => _isStartButtonEnabled;
  bool get noMatch => _noMatch;

  void updatePlayer1Guess(String guess) {
    _player1Guess = guess;
    notifyListeners();
  }

  void updatePlayerGuess(String guess) {
    if (_currentPlayerIndex == 0) {
      _player1Guess = guess;
    } else {
      _player2Guess = guess;
    }
    notifyListeners();
  }

  void updatePlayer1Name(String name) {
    _player1Name = name;
    notifyListeners();
  }

  void updatePlayer1SecretNumber(String number) {
    _player1SecretNumber = number;
    notifyListeners();
  }

  void updatePlayer2Name(String name) {
    _player2Name = name;
    _checkIfStartButtonShouldBeEnabled();
    notifyListeners();
  }

  void updatePlayer2SecretNumber(String number) {
    _player2SecretNumber = number;
    _checkIfStartButtonShouldBeEnabled();
    notifyListeners();
  }

  void completePlayer1() {
    if (_player1Name.isNotEmpty && isUniqueDigits(_player1SecretNumber)) {
      _isPlayer1Completed = true;
      notifyListeners();
    }
  }

  void _checkIfStartButtonShouldBeEnabled() {
    _isStartButtonEnabled = _player2Name.isNotEmpty &&
        _player2SecretNumber.isNotEmpty &&
        _player2SecretNumber.length == 4 &&
        isUniqueDigits(_player2SecretNumber);
  }

  void clearCurrentGuess() {
    _currentGuess = '';
    notifyListeners();
  }

  void submitGuess(String guess, BuildContext context) {
    if (_isGameActive && guess.length == 4 && isUniqueDigits(guess)) {
      _currentGuess = guess;
      String opponentSecret = _currentPlayerIndex == 0
          ? _player2SecretNumber
          : _player1SecretNumber;
      Result result = evaluateGuess(guess, opponentSecret);

      _updateFeedback(result);

      if (result.bulls == 4) {
        _isGameActive = false;
        _isGameWon = true;
        _handleWin(context);
      } else {
        switchPlayer();
      }

      notifyListeners();
    }
  }

  void _updateFeedback(Result result) {
    _feedback = '${result.bulls} Bulls, ${result.cows} Cows';
    _cow = result.cows;
    _bull = result.bulls;
    _noMatch = result.bulls == 0 && result.cows == 0;
  }

  void switchPlayer() {
    _currentPlayerIndex = 1 - _currentPlayerIndex;
  }

  void _handleWin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.darkBlue,
          title: const Text(
            'You Won!',
            style: TextStyle(color: AppColors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${_currentPlayerIndex == 0 ? _player1Name : _player2Name} has won!',
                style: const TextStyle(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void resetGame() {
    _resetPlayerData();
    _currentPlayerIndex = 0;
    _currentGuess = '';
    _feedback = '';
    _isGameActive = true;
    _isGameWon = false;
    notifyListeners();
  }

  void _resetPlayerData() {
    _player1Name = '';
    _player2Name = '';
    _player1SecretNumber = '';
    _player2SecretNumber = '';
    _isPlayer1Completed = false;
    _isStartButtonEnabled = false;
    _noMatch = false;
  }

  bool isUniqueDigits(String number) {
    return number.split('').toSet().length == number.length;
  }

  Result evaluateGuess(String guess, String secret) {
    int bulls = 0;
    int cows = 0;

    List<bool> secretMatched = List.filled(4, false);
    List<bool> guessMatched = List.filled(4, false);

    List<String> secretList = secret.split('');
    List<String> guessList = guess.split('');

    // Count bulls
    for (int i = 0; i < 4; i++) {
      if (guessList[i] == secretList[i]) {
        bulls++;
        secretMatched[i] = true;
        guessMatched[i] = true;
      }
    }

    // Count cows
    for (int i = 0; i < 4; i++) {
      if (!guessMatched[i]) {
        for (int j = 0; j < 4; j++) {
          if (!secretMatched[j] && guessList[i] == secretList[j]) {
            cows++;
            secretMatched[j] = true;
            break;
          }
        }
      }
    }

    return Result(bulls, cows);
  }
}
