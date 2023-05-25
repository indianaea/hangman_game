import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:hangman_game/UI/colors.dart';
import 'package:hangman_game/UI/widgets/hangman_photo.dart';
import 'package:hangman_game/UX/build_hangman.dart';
import 'package:hangman_game/UI/widgets/letters.dart';
import 'package:hangman_game/UX/alphabet.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
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
    _guessLetters(context, remainingLives);

    Navigator.of(context).pushNamedAndRemoveUntil(
        EndScreen.id, (Route<dynamic> route) => false,
        arguments: EndGameParameters(isWinner));
  }

  _guessLetters(BuildContext context, int remainingLives) {
    print('kjfghsdfghdkgjh');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              // Setjum upp útlitið fyrir hengimann
              // Bætum myndunum inn í appið fyrir það
              hangmanPhoto(buildHangman.tries >= 0, 'assets/hangman_start.png'),
              hangmanPhoto(buildHangman.tries >= 1, 'assets/hangman_1.png'),
              hangmanPhoto(buildHangman.tries >= 2, 'assets/hangman_2.png'),
              hangmanPhoto(buildHangman.tries >= 3, 'assets/hangman_3.png'),
              hangmanPhoto(buildHangman.tries >= 4, 'assets/hangman_4.png'),
              hangmanPhoto(buildHangman.tries >= 5, 'assets/hangman_5.png'),
              hangmanPhoto(buildHangman.tries >= 6, 'assets/hangman_all.png'),
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
                  !buildHangman.guessedLetters.contains(e.toUpperCase())))
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
            children: setupAlphabet.icelandic_alphabet.map((e) {
              return RawMaterialButton(
                onPressed: buildHangman.guessedLetters.contains(e)
                    ? null
                    : () {
                        setState(() {
                          buildHangman.guessedLetters.add(e);
                          print(buildHangman.guessedLetters);
                          if (!word.split('').contains(e.toUpperCase())) {
                            buildHangman.tries++;
                          }
                        });
                      },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                fillColor: buildHangman.guessedLetters.contains(e)
                    ? Colors.black87
                    : Colors.blueGrey,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // prufa
  _buildGameContent(BuildContext context) {
    int remainingLives = buildHangman.maxTries - buildHangman.tries;

    if (word
        .split('')
        .toSet()
        .difference(buildHangman.guessedLetters.toSet())
        .isEmpty) {
      // Leikmaður vinnur leikinn
      _navigateToEndScreen(context, true, remainingLives);
    } else if (remainingLives <= 0) {
      _navigateToEndScreen(context, false, remainingLives);
      // Leikmaður tapar leiknum
    } else {
      return _guessLetters(context, remainingLives);
      // Game in progress
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primaryColor,
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
        backgroundColor: appColors.primaryColor,
      ),
      body: _buildGameContent(context),
    );
  }
}
