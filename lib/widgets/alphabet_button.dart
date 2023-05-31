import 'package:flutter/material.dart';

// Klasi sem sýnir takka með staf á og tekur inn methodið onPressed
class AlphabetButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  AlphabetButton({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  // Ui-ið sett upp fyrir hvern takka með staf á leik skjánum
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
      fillColor: isSelected ? Colors.black87 : Colors.blueGrey,
    );
  }
}