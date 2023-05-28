class BuildHangman{
  static int maxTries = 9;
  static int tries = 0;
  static List<String> guessedLetters = [];

  static void resetGame() {
    guessedLetters.clear();
    tries = 0;
  }
}