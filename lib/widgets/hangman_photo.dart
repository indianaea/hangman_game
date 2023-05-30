import 'package:flutter/cupertino.dart';

// Fall sem býr til widget fyrir Hengimann myndina.
// Fallið tekur inn breyturnar streng og boolean til að
// ákvarða hvort sýna eigi ákveðna mynd af Hengimanninum.
Widget hangmanPhoto(bool visible, String path){
  return Visibility(
      visible: visible,
      child: Container(
        width: 250,
        height: 250,
        child: Image.asset(path),
      )
  );
}