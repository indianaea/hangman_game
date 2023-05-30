import 'package:flutter/material.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/widgets/screen_container.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/widgets/custom_button.dart';
import '../arguments/is_winner_argument.dart';

class EndScreen extends StatelessWidget {
  static const String id = 'EndScreen';

  bool isWinner = true;

  EndScreen(IsWinnerArgument args) {
    this.isWinner = args.isWinner;
  }

  void _resetGame(BuildContext context) async {
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
        Transform.translate(
          offset: Offset(0, -40.0), // Adjust the y-offset as needed
          child: Image.asset(
            'assets/end.png',
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
