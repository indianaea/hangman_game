import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/logic/build_hangman.dart';
import 'package:hangman_game/screens/game_screen.dart';

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
            Transform.translate(
              offset: Offset(0, -60.0), // Adjust the y-offset as needed
              child: Image.asset(
                'assets/front.png',
                width: 400, // Adjust width as needed
                height: 400, // Adjust height as needed
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Velkominn í leikinn Hengimann!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _selectPlayGame(context);
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
              child: Text('Spila leik'),
            ),
          ],
        ),
      ),
    );
  }
}
