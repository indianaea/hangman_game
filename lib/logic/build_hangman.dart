import 'dart:math';

// Klasi sem heldur utan um lókíkina í leiknum
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
    'Hringlaga og mjög heitt',
    'Flestir íslendingar nota þetta á hverjum degi',
    'Þú getur klætt þig í þetta',
    'Ég negli og smíða..',
    'Þú setur vökva í þetta',
    'Það er hægt að sparka í þetta og kasta',
    'Þetta gefur mörgum dauðum hlutum líf',
    'Ótrúlegur hlutur sem nær sambandi við margt',
    'Hart brauð'
  ];

  // Fall sem resetar leikinn og sem velur random orð
  BuildHangman() {
    resetGame();
    word = getRandomWord(words).toUpperCase();
  }

  // Fall sem skilar random orði frá orða-listanum
  String getRandomWord(List<String> words) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    locationIndex = randomIndex;
    return words[randomIndex];
  }

  // Fall sem resetar leikinn með því að reseta guessedLetters og tries
  void resetGame() {
    guessedLetters.clear();
    tries = 0;
  }

  // Fall sem skilar true ef giskaður stafur er í orðinu sem spilað er með
  // og sem skilar false ef giskað er á vitlausan staf.
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

  // Fall sem skilar true ef leikmaður hefur náð að giska á rétt orð
  // annars false.
  bool isWinner() {
    return word.split('').toSet().difference(guessedLetters.toSet()).isEmpty;
  }

  // Fall sem skilar true ef leikmaður er búinn að giska 9 sinnum (maxTries)
  // annars false.
  bool isLoser() {
    return tries >= maxTries;
  }

  // Fall sem skilar þeim lífum eftir sem leikmaður á í leiknum
  int remainingLives() {
    return maxTries - tries;
  }

  // Fall sem skilar réttu hinti við orðið sem verið er að spila með
  String getHint() {
    return hintText[locationIndex];
  }
}
