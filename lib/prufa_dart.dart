import 'dart:io';
import 'dart:math';

void main() {
  playGame();
}

void playGame() {
  final List<String> words = ['Epli', 'banani', 'sól', 'bíll', 'ullarsokkur'];
  final Random random = Random();
  final String selectedWord = words[random.nextInt(words.length)];
  List<String> guessedLetters = [];
  int attemptsLeft = 5;

  print('Velkomin í Hengimann!');
  print('Lengd orðsins er: ${selectedWord.length} stafir.');

  while (attemptsLeft > 0) {
    print('Líf eftir: $attemptsLeft');
    print('Orðið: ${getVisibleWord(selectedWord, guessedLetters)}');
    print('Giskaðu á það: ');
    final String guess = stdin.readLineSync()?.toLowerCase() ?? '';

    if (guess.length != 1) {
      print('Vinsamlegast settu inn einn staf.');
    } else if (guessedLetters.contains(guess)) {
      print('Þú ert nú þegar búin að giska á þennan staf.');
    } else {
      guessedLetters.add(guess);

      if (selectedWord.toLowerCase().contains(guess)) {
        print('Rétt gisk');
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

  print('Viltu spila aftur? (Já/Nei)');
  final String playAgain = stdin.readLineSync()?.toLowerCase() ?? '';
  if (playAgain == 'já') {
    playGame();
  }
}

String getVisibleWord(String word, List<String> guessedLetters) {
  List<String> visibleLetters = word.split('').map((letter) {
    return guessedLetters.contains(letter.toLowerCase()) ? letter : '_';
  }).toList();

  return visibleLetters.join(' ');
}

bool checkWin(String word, List<String> guessedLetters) {
  for (int i = 0; i < word.length; i++) {
    if (!guessedLetters.contains(word[i].toLowerCase())) {
      return false;
    }
  }
  return true;
}
