import 'package:flutter/material.dart';
import 'package:hangman_game/logic/build_hangman.dart';
import 'package:hangman_game/screens/game_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/screen_container.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'StartScreen';

  const StartScreen({Key? key}) : super(key: key);

  void _selectPlayGame(BuildContext context) {
    // Resetta leikinn þegar ýtt er aftur á takkann "Spila leik"
    BuildHangman.tries = 0;
    BuildHangman.guessedLetters.clear();

    Navigator.of(context).pushNamedAndRemoveUntil(
        GameScreen.id, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Hengimaður',
      children: [
        Transform.translate(
          offset: Offset(0, -40.0), // Adjust the y-offset as needed
          child: Image.asset(
            'assets/front.png',
            width: 400, // Adjust width as needed
            height: 400, // Adjust height as needed
          ),
        ),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Aðeins um leikinn:\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Leikurinn snýst um að spilari fær random orð \nog reynir svo að giska á það orð áður en full \nmynd af Hengimanni er teiknuð upp. \nEf spilari nær ekki að giska á rétt orð \nfær hann Hengimann.\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: '\nÞú hefur 9 líf \nÞú hefur eina vísbendingu\nGangi þér vel!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
        CustomButton(
          text: 'Spila leik',
          onPressed: () => _selectPlayGame(context),
        ),
      ],
    );
  }
}
