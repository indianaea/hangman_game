import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:hangman_game/UI/colors.dart';
import 'package:hangman_game/UI/widget/hangman_photo.dart';
import 'package:hangman_game/UX/build_hangman.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                //Setjum upp útlitið fyrir hengimann
                //Bætum myndunum inn í appið
                hangmanPhoto(buildHangman.tries >= 0, 'assets/hangman_start.png'),
                hangmanPhoto(buildHangman.tries >= 1, 'assets/hangman_1.png'),
                hangmanPhoto(buildHangman.tries >= 2, 'assets/hangman_2.png'),
                hangmanPhoto(buildHangman.tries >= 3, 'assets/hangman_3.png'),
                hangmanPhoto(buildHangman.tries >= 4, 'assets/hangman_4.png'),
                hangmanPhoto(buildHangman.tries >= 5, 'assets/hangman_5.png'),
                hangmanPhoto(buildHangman.tries >= 6, 'assets/hangman_all.png'),
              ],
            ),
          ),
          SizedBox(height: 20,
          ),
          //Smíðum núna widget fyrir földnu orðin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
        ],
      ),
    );
  }
}
