import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/widgets/hangman_photo.dart';
import 'package:hangman_game/logic/build_hangman.dart';
import 'package:hangman_game/widgets/letters.dart';
import 'package:hangman_game/constants/alphabet.dart';
import 'end_game_screen.dart';

class EndGameParameters {
  final bool isWinner;

  EndGameParameters(this.isWinner);
}

class GameScreen extends StatefulWidget {
  static const String id = 'GameScreen';

  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Listi af orðum fyrir leikinn
  List<String> words = [
    'Epli',
    'Banani',
    'Sól',
    'Bíll',
    'Sokkur',
    'Hamar',
    'Tebolli',
    'Bolti',
    'Batterí',
    'Útvarp',
    'Ristavél'
  ];

  // Setjum random orðið okkar í streng
  String word = ''.toUpperCase();

  @override
  void initState() {
    super.initState();
    // Veljum random orð úr listanum okkar
    word = getRandomWord(words).toUpperCase();
  }

  String getRandomWord(List<String> words) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    return words[randomIndex];
  }

  _navigateToEndScreen(
      BuildContext context, bool isWinner, remainingLives) async {
    await Future.delayed(Duration(seconds: 1));

    await Navigator.of(context).pushNamedAndRemoveUntil(
        EndScreen.id, (Route<dynamic> route) => false,
        arguments: EndGameParameters(isWinner));
  }

  _guessLetters(BuildContext context, int remainingLives) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              for (int i = 0; i <= 9; i++)
                hangmanPhoto(BuildHangman.tries >= i, 'assets/hangman_$i.png'),
            ],
          ),
        ),

        // Smíðum núna widget fyrir földnu orðin
        // Förum aftur í að byggja hengimaninn og bætum við breytu þar til að geyma
        // staf og athuga hvort sá stafur sé í orðinu sem verið er að spila með
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: word
              .split('')
              .map((e) => letter(e.toUpperCase(),
                  !BuildHangman.guessedLetters.contains(e.toUpperCase())))
              .toList(),
        ),

        // Setja fram þau líf sem leikmaður á eftir
        Text(
          'Þú átt: $remainingLives líf eftir',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),

        // Setjum núna upp lyklaborðið með hjálp frá alphabet skránni
        SizedBox(
          width: double.infinity,
          height: 240.0,
          child: GridView.count(
            crossAxisCount: 8,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            padding: EdgeInsets.all(8.0),
            children: SetupAlphabet.icelandic_alphabet.map((e) {
              return RawMaterialButton(
                onPressed: BuildHangman.guessedLetters.contains(e)
                    ? null
                    : () {
                        setState(() {
                          BuildHangman.guessedLetters.add(e);
                          if (!word.split('').contains(e.toUpperCase())) {
                            BuildHangman.tries++;
                          }
                        });
                      },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                fillColor: BuildHangman.guessedLetters.contains(e)
                    ? Colors.black87
                    : Colors.blueGrey,
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // prufa
  _buildGameContent(BuildContext context) {
    int remainingLives = BuildHangman.maxTries - BuildHangman.tries;

    if (word
        .split('')
        .toSet()
        .difference(BuildHangman.guessedLetters.toSet())
        .isEmpty) {
      // Leikmaður vinnur leikinn
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToEndScreen(context, true, remainingLives);
      });
    } else if (remainingLives <= 0) {
      // Leikmaður tapar leiknum
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToEndScreen(context, false, remainingLives);
      });
    }

    return _guessLetters(context, remainingLives);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Hengimaður',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: _buildGameContent(context),
    );
  }
}
