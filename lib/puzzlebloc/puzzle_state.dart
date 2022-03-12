part of 'puzzle_bloc.dart';

abstract class PuzzleState extends Equatable {
  const PuzzleState();
}

class PuzzleIdle extends PuzzleState {
  @override
  List<Object?> get props => [];
}

//for Loading
class PuzzleChosenLoadingStart extends PuzzleState {
  @override
  List<Object?> get props => [];
}

class PuzzleChosenLoadingEnded extends PuzzleState {
  @override
  List<Object?> get props => [];
}

//loadFirstGame
class PuzzleChosenFirstGame extends PuzzleState {
  final List<SliderPieces> sliderPieces;
  final String imageChosen;

  const PuzzleChosenFirstGame(this.sliderPieces, this.imageChosen);

  @override
  List<Object?> get props => [sliderPieces, imageChosen];
}

//gameEngineLoop
class PuzzleEngineLoop extends PuzzleState {
  final List<SliderPieces> sliderPieces;
  final int moves;

  const PuzzleEngineLoop(this.sliderPieces, this.moves,);

  @override
  List<Object?> get props => [sliderPieces, moves];
}

class PuzzleLoop extends PuzzleState {
  final List<SliderPieces> sliderPieces;

  const PuzzleLoop(this.sliderPieces);

  @override
  List<Object?> get props => sliderPieces;
}

class PuzzleShuffle extends PuzzleState {
  final List<SliderPieces> sliderPieces;
  final int moves;

  const PuzzleShuffle(this.sliderPieces, this.moves);

  @override
  List<Object?> get props => [sliderPieces, moves];
}

class PuzzleWin extends PuzzleState {
  @override
  List<Object?> get props => [];
}

class AnotherGame extends PuzzleState {
  @override
  List<Object?> get props => [];
}

class GameBack extends PuzzleState {
  @override
  List<Object?> get props => [];
}
