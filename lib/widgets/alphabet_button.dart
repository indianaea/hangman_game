import 'package:flutter/material.dart';

class AlphabetButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  AlphabetButton({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

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