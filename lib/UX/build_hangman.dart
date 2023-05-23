class buildHangman{
  static int maxTries = 6;
  static int tries = 0;
  static List<String> guessedLetters = [];

  static void resetGame() {
    guessedLetters.clear();
    tries = 0;
  }

}