import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';

// Búum til StatelessWidget sem setur upp grunn fyrir skjá mynd
class ScreenContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  ScreenContainer({required this.title, required this.children});

  // UI-ið sett upp fyrir grunn skjá mynd, sem hægt er að nota svo
  // á fleiri en einum skjá í gegnum appið.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
