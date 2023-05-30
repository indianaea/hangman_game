import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';

// Fall sem býr til sérsniðinn takka sem tekur inn texta sem streng
// og ákveðna aðgerð þegar smellt er á hann.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  // Skilgreinum build method sem skilar alltaf alveg eins takka (widget)
  // nema með þeim aðgerðum sem settar eru í hann og texta.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
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
        child: Text(text),
      );
  }
}