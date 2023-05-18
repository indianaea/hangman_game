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
    printStatus(attemptsLeft, selectedWord, guessedLetters);
    final String guess = readGuess();

    if (isValidGuess(guess, guessedLetters)) {
      guessedLetters.add(guess);

      if (isCorrectGuess(guess, selectedWord)) {
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

  playAgain();
}

void printStatus(int attemptsLeft, String selectedWord, List<String> guessedLetters) {
  print('Líf eftir: $attemptsLeft');
  print('Orðið: ${getVisibleWord(selectedWord, guessedLetters)}');
}

String readGuess() {
  print('Giskaðu á staf: ');
  final String guess = stdin.readLineSync()?.toLowerCase() ?? '';
  return guess;
}

bool isValidGuess(String guess, List<String> guessedLetters) {
  if (guess.length != 1) {
    print('Vinsamlegast settu inn einn staf.');
    return false;
  } else if (guessedLetters.contains(guess)) {
    print('Þú ert nú þegar búin að giska á þennan staf.');
    return false;
  }
  return true;
}

bool isCorrectGuess(String guess, String selectedWord) {
  return selectedWord.toLowerCase().contains(guess);
}

void playAgain() {
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
