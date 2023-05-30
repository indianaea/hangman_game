import 'dart:math';

class BuildHangman {
  static const maxTries = 9;
  static int tries = 0;

  List<String> guessedLetters = [];
  late String word;

  int locationIndex = 0;

  List<String> words = [
    'Banani',
    'Svalir',
    'Sól',
    'Bíll',
    'Sokkar',
    'Hamar',
    'Tebolli',
    'Bolti',
    'Batterí',
    'Útvarp',
    'Ristavél',
  ];

  List<String> hintText = [
    'Þetta er ávöxtur',
    'Mætti kalla þetta fylgihlut margra bygginga',
    'Hringlaga og mjög stórt',
    'Flestir íslendingar nota þetta á hverjum degi',
    'Þú getur klætt þig í þetta',
    'Ég negli og smíða..',
    'Þú setur vökva í þetta',
    'Það er hægt að sparka í þetta og kasta',
    'Þetta gefur mörgum dauðum hlutum líf',
    'Ótrúlegur hlutur sem nær sambandi við margt',
    'Hart brauð'
  ];

  BuildHangman() {
    resetGame();
    word = getRandomWord(words).toUpperCase();
  }

  String getRandomWord(List<String> words) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    locationIndex = randomIndex;
    return words[randomIndex];
  }

  void resetGame() {
    guessedLetters.clear();
    tries = 0;
  }

  bool guessLetter(String letter) {
    if (tries < maxTries) {
      guessedLetters.add(letter);
      if (!word.split('').contains(letter.toUpperCase())) {
        tries++;
        return false;
      }
      return true;
    }
    return false;
  }

  bool isWinner() {
    return word.split('').toSet().difference(guessedLetters.toSet()).isEmpty;
  }

  bool isLoser() {
    return tries >= maxTries;
  }

  int remainingLives() {
    return maxTries - tries;
  }

  String getHint() {
    return hintText[locationIndex];
  }
}
