import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'arguments/is_winner_argument.dart';
import 'screens/end_game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

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
