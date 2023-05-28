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

// Fyrsti skjárinn sem birtist þegar appið er opnað og þar sem
// byrjað er að keyra leikinn í gang.
class GameScreen extends StatefulWidget {
  static const String id = 'GameScreen';

  const GameScreen({Key? key}) : super(key: key);

  // State-ið á Scaffoldinu
  @override
  _GameScreenState createState() => _GameScreenState();
}
// State-ið fyrir GameScreen
class _GameScreenState extends State<GameScreen> {
  // Listi af orðum sem hægt er að fá í leiknum.
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
  // Orðið sem var randomly valið fyrir leikinn
  String word = ''.toUpperCase();

  @override
  void initState() {
    super.initState();
    // Veljum random orð úr listanum okkar þegar leikurinn er spilaður.
    word = getRandomWord(words).toUpperCase();
  }

  // Setjum upp fall sem nær í random orð úr words listanum.
  String getRandomWord(List<String> words) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    return words[randomIndex];
  }

  _navigateToEndScreen(
      BuildContext context, bool isWinner, remainingLives) async {
    // Seinkum navigation á næst skjá um 1 sekúndu til að leyfa öllum undanfarandi aðgerðum að klára
    // og svo leikmaður fái að sjá fullt orð sem hann vann með eða allan Hengimann ef hann tapaði
    // áður en farið er með hann á loka skjáinn.
    await Future.delayed(Duration(seconds: 1));

    await Navigator.of(context).pushNamedAndRemoveUntil(
        EndScreen.id, (Route<dynamic> route) => false,
        arguments: EndGameParameters(isWinner));
  }

  // Setjum upp fall sem heldur utan um stafina sem verið er að giska á í leiknum
  // og sem setur þá fram í notendaviðmótinu.
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

        // Setjum fram orðið með "Row" sem verið er að giska á.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: word
              .split('')
              .map((e) => letter(e.toUpperCase(),
                  !BuildHangman.guessedLetters.contains(e.toUpperCase())))
              .toList(),
        ),

        // Setjum fram þau líf sem leikmaður á eftir í leiknum
        Text(
          'Þú átt: $remainingLives líf eftir',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),

        // Uppsetning á lyklaborði með hjálp frá alphabet skránni
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

  // Setjum upp fall til að halda utan um ferlið á leiknum og
  // sem ákvarðar hvort leikmaður sé búinn að vinna eða tapa leiknum.
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
  // Notum build method með Scaffold til að skilgreina uppsetninguna og útlitið á appinu,
  // með öðrum orðum til að setja upp UI-ið fyrir leikinn.
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
      // Köllum í fallið _buildGameContent til að setja upp sjálfan leikinn.
      body: _buildGameContent(context),
    );
  }
}
