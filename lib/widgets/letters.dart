import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 55,
    width: 45,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: AppColors.primaryColorDark,
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
            fontSize: 28.0,
          ),
        ),
      ),
    ),
  );
}
