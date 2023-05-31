import 'package:flutter/material.dart';
import 'package:hangman_game/arguments/is_winner_argument.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/widgets/hangman_photo.dart';
import 'package:hangman_game/logic/build_hangman.dart';
import 'package:hangman_game/widgets/letters.dart';
import 'package:hangman_game/constants/alphabet.dart';
import 'package:hangman_game/widgets/hint_icon_button.dart';
import '../widgets/alphabet_button.dart';
import 'end_game_screen.dart';

// Klasi sem sýnir leik skjáinn þar sem sjálfur leikurinn fer fram á
class GameScreen extends StatefulWidget {
  static const String id = 'GameScreen';

  const GameScreen({Key? key}) : super(key: key);

  // State-ið á Scaffoldinu
  @override
  _GameScreenState createState() => _GameScreenState();
}

// Klasi sem tekur Game Screen sem state
class _GameScreenState extends State<GameScreen> {
  late BuildHangman game;

  // Frumstillum gildi
  @override
  void initState() {
    super.initState();
    game = BuildHangman();
  }

  // Fall sem seinkar navigation á næst skjá um 1 sekúndu til að leyfa öllum
  // undanfarandi aðgerðum að klára og svo leikmaður fái að sjá fullt orð sem
  // hann vann með eða allan Hengimann ef hann tapaði.
  _navigateToEndScreen(BuildContext context, bool isWinner) async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.of(context).pushNamedAndRemoveUntil(
        EndScreen.id, (Route<dynamic> route) => false,
        arguments: IsWinnerArgument(isWinner));
  }

  // Fall sem heldur utan um stafina sem verið er að giska á
  // í leiknum og sem setur þá fram í notendaviðmótinu.
  _guessLetters(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              // Setjum upp Hengimanninn með því að bæta inn myndum á skjáinn,
              // farandi eftir hvar leikmaður er staddur í leiknum (tries).
              for (int i = 0; i <= 9; i++)
                hangmanPhoto(BuildHangman.tries >= i, 'assets/hangman_$i.png'),
            ],
          ),
        ),

        // Setjum fram orðið með "Row" sem verið er að giska á og náum í
        // widgetið letter til sýna útlitið á því.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: game.word
              .split('')
              .map((e) => letter(e.toUpperCase(),
                  !game.guessedLetters.contains(e.toUpperCase())))
              .toList(),
        ),

        // Setjum fram þau líf sem leikmaður á eftir í leiknum
        Text(
          'Þú átt: ${game.remainingLives()} líf eftir',
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
              return AlphabetButton(
                text: e,
                onPressed: () {
                  setState(() {
                    game.guessLetter(e);
                  });
                },
                isSelected: game.guessedLetters.contains(e),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Fall sem heldur utan um ferlið á leiknum og sem ákvarðar hvort
  // leikmaður sé búinn að vinna eða tapa leiknum. Og sem fer síðan með
  // leikmann á næsta skjá.
  _buildGameContent(BuildContext context) {
    if (game.isWinner() || game.isLoser()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToEndScreen(context, game.isWinner());
      });
    }
    return _guessLetters(context);
  }

  // Notum build method með Scaffold til að skilgreina uppsetninguna
  // og útlitið á appinu, með öðrum orðum til að setja upp UI-ið
  // fyrir leikinn.
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
        leading: BuildHangman.tries >= 2 ? HintIconButton(hint: game.getHint()) : null,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: _buildGameContent(context),
    );
  }
}
