import 'package:flutter/material.dart';
import 'package:hangman_game/UI/colors.dart';
import 'package:hangman_game/main.dart';
import 'package:hangman_game/UX/build_hangman.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  void _selectPlayGame(BuildContext context) {
    // Reset the game state
    buildHangman.tries = 0;
    buildHangman.guessedLetters.clear();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomeApp()));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Velkominn í Hengimað',
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
                backgroundColor: appColors.primaryColorDark,
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
