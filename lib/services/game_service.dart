class BullsAndCowsGame {
  String secretNumber;
  List<Map<String, int>> guessHistory = [];

  BullsAndCowsGame(this.secretNumber);

  Map<String, int> checkGuess(String guess) {
    int bulls = 0;
    int cows = 0;

    for (int i = 0; i < guess.length; i++) {
      if (guess[i] == secretNumber[i]) {
        bulls++;
      } else if (secretNumber.contains(guess[i])) {
        cows++;
      }
    }

    // Add to history for display purposes
    guessHistory.add({"bulls": bulls, "cows": cows});
    return {"bulls": bulls, "cows": cows};
  }

  // Method to reset the game
  void resetGame(String newSecret) {
    secretNumber = newSecret;
    guessHistory.clear();
  }
}
