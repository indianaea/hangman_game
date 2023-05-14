import 'dart:io';
import 'dart:math';

void main() {
  final List<String> words = ['epli', 'banani', 'sól', 'bíll', 'ullarsokkur'];
  final Random random = Random();
  final String selectedWord = words[random.nextInt(words.length)];
  List<String> guessedLetters = [];
  int attemptsLeft = 6;

  print('Velkomin í Hengimann!');
  print('Lengd orðsins er: ${selectedWord.length} stafir.');

  while (attemptsLeft > 0) {
    print('Líf eftir: $attemptsLeft');
    print('Orðið: ${getVisibleWord(selectedWord, guessedLetters)}');
    print('Giskaðu á það:');
    final String guess = stdin.readLineSync()?.toLowerCase() ?? '';

    if (guess.length != 1) {
      print('Settu inn einn staf.');
      continue;
    }

    if (guessedLetters.contains(guess)) {
      print('Þú ert nú þegar búin að giska á þennan staf.');
      continue;
    }

    guessedLetters.add(guess);

    if (selectedWord.contains(guess)) {
      print('Rétt gisk!');
      if (checkWin(selectedWord, guessedLetters)) {
        print('Til hamingju þú vannst!');
        break;
      }
    } else {
      print('Rangt gisk!');
      attemptsLeft--;
      if (attemptsLeft == 0) {
        print('Leik lokið! Þú tapaðir því miður. Orðið var: $selectedWord');
      }
    }
  }
}

String getVisibleWord(String word, List<String> guessedLetters) {
  String visibleWord = '';
  for (int i = 0; i < word.length; i++) {
    if (guessedLetters.contains(word[i])) {
      visibleWord += word[i];
    } else {
      visibleWord += '_';
    }
    visibleWord += ' ';
  }
  return visibleWord.trim();
}

bool checkWin(String word, List<String> guessedLetters) {
  for (int i = 0; i < word.length; i++) {
    if (!guessedLetters.contains(word[i])) {
      return false;
    }
  }
  return true;
}