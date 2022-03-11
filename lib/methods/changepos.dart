import 'dart:math';
import 'dart:ui';

import '../models/sliderPiece.dart';

changePos(int indexCurrent, List sliderPiece, int value) {
  SliderPieces emptyObject = sliderPiece.firstWhere((element) => element.empty);

  int emptyIndex = emptyObject.indexCurrent;

  int minIndex = min(indexCurrent, emptyIndex);
  int maxIndex = max(indexCurrent, emptyIndex);

  List<SliderPieces>? rangeMoves = [];

  if (indexCurrent % value == emptyIndex % value) {
    rangeMoves = sliderPiece
        .where(
            (element) => element.indexCurrent % value == indexCurrent % value)
        .cast<SliderPieces>()
        .toList();
  } else if (indexCurrent ~/ value == emptyIndex ~/ value) {
    rangeMoves = sliderPiece.cast<SliderPieces>();
  } else {
    rangeMoves = [];
  }

  rangeMoves = rangeMoves
      .where((puzzle) =>
          puzzle.indexCurrent >= minIndex &&
          puzzle.indexCurrent <= maxIndex &&
          puzzle.indexCurrent != emptyIndex)
      .toList();

  if (emptyIndex < indexCurrent) {
    rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 1 : 0);
  } else {
    rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 0 : 1);
  }

  if (rangeMoves.isNotEmpty) {
    int tempIndex = rangeMoves[0].indexCurrent;

    Offset tempPos = rangeMoves[0].posCurrent;

    for (var i = 0; i < rangeMoves.length - 1; i++) {
      rangeMoves[i].indexCurrent = rangeMoves[i + 1].indexCurrent;
      rangeMoves[i].posCurrent = rangeMoves[i + 1].posCurrent;
    }

    rangeMoves.last.indexCurrent = emptyObject.indexCurrent;
    rangeMoves.last.posCurrent = emptyObject.posCurrent;

    emptyObject.indexCurrent = tempIndex;
    emptyObject.posCurrent = tempPos;
  }
}
