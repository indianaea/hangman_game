import 'package:flutter/material.dart';
import 'package:hangman_game/screens/game_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/screen_container.dart';

// Klasi sem sýnir fyrsta skjáinn sem birtist þegar appið er opnað og þar sem
// byrjað er að keyra leikinn í gang.
class StartScreen extends StatelessWidget {
  static const String id = 'StartScreen';

  const StartScreen({Key? key}) : super(key: key);

  // Fall sem fer með leikmann á næsta skjá - þar sem leikurinn hefst
  void _selectPlayGame(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        GameScreen.id, (Route<dynamic> route) => false);
  }

  // UI-ið sett upp fyrir fyrsta skjáinn þar sem leiðbeiningar fyrir
  // leikmann koma fram og takki til að byrja spila leikinn.
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Hengimaður',
      children: [
        Transform.translate(
          offset: Offset(0, -30.0), // Adjust the y-offset as needed
          child: Image.asset(
            'assets/front.png',
            width: 350, // Adjust width as needed
            height: 350, // Adjust height as needed
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Aðeins um leikinn\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nLeikurinn snýst um að spilari fær random orð og \nhann reynir svo að giska á það orð áður en full \nmynd af Hengimanni er teiknuð upp. Ef spilari nær \nekki að giska á rétt orð fær hann Hengimann. \n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nÞú hefur 9 líf \nÞú færð eina vísbendingu gefna eftir 2 tilraunir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Transform.translate(
          offset: Offset(0, -10), // change value as needed
          child: CustomButton(
            text: 'Spila leik',
            onPressed: () => _selectPlayGame(context),
          ),
        ),
      ],
    );
  }
}
