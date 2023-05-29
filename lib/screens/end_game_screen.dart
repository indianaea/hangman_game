import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/logic/build_hangman.dart';

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

    Future.microtask(() {
      Navigator.of(context).pushNamedAndRemoveUntil(
          GameScreen.id, (Route<dynamic> route) => false);
    });
  }

  void _goToStartScreen(BuildContext context) async {

    Future.microtask(() {
      Navigator.of(context).pushNamedAndRemoveUntil(
          StartScreen.id, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    String message = isWinner
        ? 'Þvílíkur snillingur! Þú vannst leikinn!'
        : 'Æi þú tapaðir! Endilega reyndu aftur!';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
              onPressed: () {
                _resetGame(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorDark,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Spila leik aftur'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToStartScreen(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorDark,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Fara á upphafsskjá'),
            ),
          ],
        ),
      ),
    );
  }
}
