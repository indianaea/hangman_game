import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'arguments/is_winner_argument.dart';
import 'screens/end_game_screen.dart';

// Main fallið til að keyra appið/leikinn
void main() {
  runApp(MyApp());
}

// Búuum til MyApp sem er StatelessWidget og er rótin að appinu
class MyApp extends StatelessWidget {

  // UI-ið sett upp fyrir MaterialApp sem er widget sem getur haldið utan um
  // mörg önnur widget í appinu sem notuð eru fyrir Material Design Applications.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.id,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case StartScreen.id:
            return MaterialPageRoute(builder: (context) => const StartScreen());
          case GameScreen.id:
            return MaterialPageRoute(builder: (context) => const GameScreen());
          case EndScreen.id:
            return MaterialPageRoute(
                builder: (context) =>
                    EndScreen(settings.arguments as IsWinnerArgument));
          default:
            return null;
        }
      },
    );
  }
}

// Ui-ið sett upp með Scaffoldi
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
  );
}
