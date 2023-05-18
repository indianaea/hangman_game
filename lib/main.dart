import 'package:flutter/material.dart';
import 'package:hangman_game/UI/litir.dart';
import 'package:hangman_game/UI/myndir/hangman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      backgroundColor: appLitir.primaryColor,
      appBar: AppBar(
        title: Text('Hengimaður'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: appLitir.primaryColor,
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
                hangmanPhoto(true, 'assets/hangman_all.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
