import 'package:flutter/cupertino.dart';

// Fall sem býr til widget fyrir Hengimann myndina.
// Fallið tekur inn breyturnar streng og boolean til að
// ákvarða hvort sýna eigi ákveðna mynd af Hengimanninum.
Widget hangmanPhoto(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.only(top: 15), // Add space above the picture
        child: Container(
          width: 270,
          height: 270,
          child: Image.asset(path),
        ),
      ));
}
