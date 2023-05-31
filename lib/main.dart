import 'package:flutter/material.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'arguments/is_winner_argument.dart';
import 'screens/end_game_screen.dart';

// Main fallið til að keyra appið/leikinn
void main() {
  runApp(MyApp());
}

// Búuum til MyApp sem er rótin að appinu
class MyApp extends StatelessWidget {

  // Skilar Material App sem sér um route-ing í appinu, það stjórnar hvaða
  // skjár birtist að hverju sinni.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Fyrsti skjárinn sem birtist í appinu
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
