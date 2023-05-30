import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';
import 'package:hangman_game/logic/build_hangman.dart';

// Fall sem býr til hint takkann þegar leikmaður er að spila leikinn
class HintIconButton extends StatelessWidget {
  final BuildHangman game;

  HintIconButton({required this.game});

  // UI-ið sett upp fyrir hint takkann sem birtist í 3 sekúndur eftir
  // að leikmaður hefur ýtt á það.
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.question_mark, color: AppColors.pinkColor, size: 30),
      onPressed: () {
        final String hint = game.getHint();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.pinkColor,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(maxHeight: 200, maxWidth: 200),
                  child: Center(
                    child: Text(hint),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
