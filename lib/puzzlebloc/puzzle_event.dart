part of 'puzzle_bloc.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();
}

class ChoosePuzzle extends PuzzleEvent {
  final String imagePath;
  final int hCount;
  final int vCount;
  final double size;

  const ChoosePuzzle(
      {required this.imagePath,
      required this.hCount,
      required this.vCount,
      required this.size});

  @override
  List<Object> get props => [imagePath, hCount, vCount];
}

class ChangePos extends PuzzleEvent {
  final List<SliderPieces> sliderPieces;
  final int indexCurrent;

  const ChangePos({required this.indexCurrent, required this.sliderPieces});

  @override
  List<Object> get props => [indexCurrent, sliderPieces];
}

class Shuffle extends PuzzleEvent {
  final List<SliderPieces> sliderPieces;

  const Shuffle({required this.sliderPieces});

  @override
  List<Object?> get props => [];
}

class Back extends PuzzleEvent {
  @override
  List<Object?> get props => [];
}

class NewGame extends PuzzleEvent {
  @override
  List<Object?> get props => [];
}
