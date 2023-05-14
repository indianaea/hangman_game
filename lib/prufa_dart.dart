import 'dart:io';
import 'dart:math';

void main() {
  final List<String> words = ['apple', 'banana', 'cherry', 'durian', 'elderberry'];
  final Random random = Random();
  final String selectedWord = words[random.nextInt(words.length)];
  List<String> guessedLetters = [];
  int attemptsLeft = 6;

  print('Welcome to Hangman!');
  print('The word contains ${selectedWord.length} letters.');

  while (attemptsLeft > 0) {
    print('Attempts Left: $attemptsLeft');
    print('Word: ${getVisibleWord(selectedWord, guessedLetters)}');
    print('Enter your guess:');
    final String guess = stdin.readLineSync().trim().toLowerCase();

    if (guess.length != 1) {
      print('Please enter a single letter.');
      continue;
    }

    if (guessedLetters.contains(guess)) {
      print('You have already guessed that letter.');
      continue;
    }

    guessedLetters.add(guess);

    if (selectedWord.contains(guess)) {
      print('Correct guess!');
      if (checkWin(selectedWord, guessedLetters)) {
        print('Congratulations! You won!');
        break;
      }
    } else {
      print('Wrong guess!');
      attemptsLeft--;
      if (attemptsLeft == 0) {
        print('Game over! You lost. The word was $selectedWord');
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