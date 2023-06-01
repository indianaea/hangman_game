import 'package:flutter/material.dart';
import 'package:hangman_game/constants/colors.dart';

// Fall sem býr til hint takkann þegar leikmaður er að spila leikinn
class HintIconButton extends StatelessWidget {
  final String hint;

  HintIconButton({required this.hint});

  // UI-ið sett upp fyrir hint takkann sem birtir hintið þegar leikmaður ýtir
  // á hann og lokast ef leikmaður ýtir á x-ið í horninu eða annarsstaðar
  // á skjáinn.
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.question_mark, color: AppColors.pinkColor, size: 34),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.pinkColor,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200, maxWidth: 200),
                        child: Center(
                          child: Text(hint),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}