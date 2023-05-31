import 'package:flutter/material.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/widgets/screen_container.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/widgets/custom_button.dart';
import '../arguments/is_winner_argument.dart';

// Klasi sem sýnir loka skjáinn í leiknum þar sem niðurstöðurnar hvort
// leikmaður vann eða tapaði koma fram á.
class EndScreen extends StatelessWidget {
  static const String id = 'EndScreen';

  bool isWinner = true;

  // Fall sem tekur inn IsWinnerArgument til að ákvarða state-ið á leiknum
  EndScreen(IsWinnerArgument args) {
    this.isWinner = args.isWinner;
  }

  // Aðferð til að reseta leikinn og fara á leik skjáinn og spila
  // leikinn aftur.
  void _resetGame(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        GameScreen.id, (Route<dynamic> route) => false);
  }

  // Aðferð til að fara tilbaka á upphafskjá ef leikmaður velur það
  void _goToStartScreen(BuildContext context) async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          StartScreen.id, (Route<dynamic> route) => false);
  }

  // UI-ið sett upp fyrir enda skjáinn með widgetinu ScreenContainer
  // þar sem leikmaður fær þau skilaboð og mynd hvort hann vann eða tapaði
  // leiknum og fær valmöguleikana að spila aftur eða fara á upphafskjá.
  @override
  Widget build(BuildContext context) {
    String message = isWinner
        ? 'Þvílíkur snillingur! Þú vannst leikinn!'
        : 'Æi þú tapaðir! Endilega reyndu aftur!';

    String imageAsset = isWinner
        ? 'assets/winner.png' // update with the path to your winner image
        : 'assets/loser.png'; // update with the path to your loser image

    return ScreenContainer(
      title: 'Hengimaður',
      children: [
        Transform.translate(
          offset: Offset(0, -40.0), // Adjust the y-offset as needed
          child: Image.asset(
            imageAsset,
            width: 400, // Adjust width as needed
            height: 400, // Adjust height as needed
          ),
        ),
        Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 20.0),
        CustomButton(
          text: 'Spila leik aftur',
          onPressed: () => _resetGame(context),
        ),
        CustomButton(
          text: 'Fara á upphafsskjá',
          onPressed: () => _goToStartScreen(context),
        ),
      ],
    );
  }
}
