import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:hangman_game/UI/colors.dart';
import 'package:hangman_game/UI/widgets/hangman_photo.dart';
import 'package:hangman_game/UX/build_hangman.dart';
import 'package:hangman_game/UI/widgets/letters.dart';
import 'package:hangman_game/UX/alphabet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // Listi af orðum fyrir leikinn
  List<String> words = ['Epli', 'Banani', 'Sól', 'Bíll', 'Sokkur', 'Hamar', 'Kiwi'];

  // Randomly selected word for the game
  String word = ''.toUpperCase();

  @override
  void initState() {
    super.initState();
    // Veljum random orð úr listanum okkar
    word = getRandomWord(words).toUpperCase();
  }
  //
  String getRandomWord(List<String> words) {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    return words[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: AppBar(
        title: Text('Hengimaður'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: appColors.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                //Setjum upp útlitið fyrir hengimann
                //Bætum myndunum inn í appið
                hangmanPhoto(
                    buildHangman.tries >= 0, 'assets/hangman_start.png'),
                hangmanPhoto(buildHangman.tries >= 1, 'assets/hangman_1.png'),
                hangmanPhoto(buildHangman.tries >= 2, 'assets/hangman_2.png'),
                hangmanPhoto(buildHangman.tries >= 3, 'assets/hangman_3.png'),
                hangmanPhoto(buildHangman.tries >= 4, 'assets/hangman_4.png'),
                hangmanPhoto(buildHangman.tries >= 5, 'assets/hangman_5.png'),
                hangmanPhoto(buildHangman.tries >= 6, 'assets/hangman_all.png'),
              ],
            ),
          ),

          //Smíðum núna widget fyrir földnu orðin
          //Förum aftur í að byggja hengimaninn og bætum við breytu þar til að geyma
          //staf og athuga hvort sá stafur sé í orðinu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !buildHangman.guessedLetters.contains(e.toUpperCase())))
                .toList(),
          ),

          //Setjum núna upp lyklaborðið
          SizedBox(
            width: double.infinity,
            height: 240.0,
            child: GridView.count(
              crossAxisCount: 8,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: setupAlphabet.icelandic_alphabet.map((e) {
                return RawMaterialButton(
                  onPressed: buildHangman.guessedLetters.contains(e) ? null : () {
                    setState(() {
                      buildHangman.guessedLetters.add(e);
                      print(buildHangman.guessedLetters);
                      if (!word.split('').contains(e.toUpperCase())) {
                        buildHangman.tries++;
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: buildHangman.guessedLetters.contains(e)
                      ? Colors.black87
                      : Colors.blueGrey,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
