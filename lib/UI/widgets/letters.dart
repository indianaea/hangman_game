import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/UI/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: appColors.primaryColorDark,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36.0,
          ),
        ),
      ),
    ),
  );
}
