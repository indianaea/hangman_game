import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:hangman_game/UI/colors.dart';
import 'package:hangman_game/UI/widgets/hangman_photo.dart';
import 'package:hangman_game/UX/build_hangman.dart';
import 'package:hangman_game/UI/widgets/letters.dart';
import 'package:hangman_game/UX/alphabet.dart';
import 'package:hangman_game/navigation.dart';
import 'package:hangman_game/screens/start_game_screen.dart';
import 'package:hangman_game/screens/game_screen.dart';


import 'screens/end_game_screen.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        GameScreen.id:  (context) => GameScreen(),
        EndScreen.id:  (context) => EndScreen(isWinner: false),
      },
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
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
    );
  }
