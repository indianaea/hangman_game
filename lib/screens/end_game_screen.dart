import 'package:flutter/material.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/widgets/screen_container.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/logic/build_hangman.dart';
import 'package:hangman_game/widgets/custom_button.dart';

class EndScreen extends StatelessWidget {
  static const String id = 'EndScreen';

  final bool isWinner;

  const EndScreen({
    Key? key,
    required this.isWinner,
  }) : super(key: key);

  void _resetGame(BuildContext context) async {
    // Resetta leikinn þegar ýtt er aftur á takkann "Spila leik"
    BuildHangman.tries = 0;
    BuildHangman.guessedLetters.clear();

    Navigator.of(context).pushNamedAndRemoveUntil(
        GameScreen.id, (Route<dynamic> route) => false);
  }

  void _goToStartScreen(BuildContext context) async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          StartScreen.id, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    String message = isWinner
        ? 'Þvílíkur snillingur! Þú vannst leikinn!'
        : 'Æi þú tapaðir! Endilega reyndu aftur!';

    return ScreenContainer(
      title: 'Hengimaður',
      children: [
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
