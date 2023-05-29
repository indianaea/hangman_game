import 'package:flutter/cupertino.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/screens/end_game_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route ? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'StartScreen':
        return MaterialPageRoute(builder: (_) => StartScreen());
      case 'GameScreen':
        return MaterialPageRoute(builder: (_) => GameScreen());
      case 'EndScreen':
        return MaterialPageRoute(builder: (_) => EndScreen(isWinner: true));
    }
  }
}