import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';


class EndGameButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final double? horizontal;
  final double? vertical;
  final double? borderRadius;
  final String? text;
  final VoidCallback? onTab;
  final BuildContext? buildContext;

  EndGameButton({this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.horizontal,
    this.vertical,
    this.borderRadius,
    this.text,
    this.onTab,
    this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColorDark,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontSize: 20.0,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text('Spila leik aftur'),
      ),
    );
  }
}