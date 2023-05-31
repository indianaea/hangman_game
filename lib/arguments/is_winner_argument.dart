// Klasi sem heldur utan um hvort leikmaður vinni eða tapi leiknum
// með breytunni isWinner.

// Hann er notaður sem argument í route-ing sem er staðsett í main
// fyrir end_game screen.

class IsWinnerArgument {
  final bool isWinner;
  IsWinnerArgument(this.isWinner);
}