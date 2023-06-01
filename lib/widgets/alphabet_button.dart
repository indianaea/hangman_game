import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';

// Klasi sem sýnir takka með staf á og tekur inn methodið onPressed,
// texta sem streng og boolean ef smellt er á takka.
class AlphabetButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  AlphabetButton({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  // Ui-ið sett upp fyrir hvern takka með staf á leikskjánum
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: isSelected ? null : onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      fillColor: isSelected ? AppColors.pinkColor : Colors.blueGrey,
    );
  }
}