import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_puzzle_game/models/imagetofile.dart';
import 'package:my_puzzle_game/models/sliderPiece.dart';

import '../methods/changepos.dart';

part 'puzzle_event.dart';

part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  List<SliderPieces> sliderPiece = <SliderPieces>[];
  late int value;
  bool success = false;
  late List<int> process;
  int moves = 0;
  String imgPath = '';

  PuzzleBloc() : super(PuzzleIdle()) {
    on<ChoosePuzzle>(onPuzzleChosen);
    on<ChangePos>(onGameEngine);
    on<Shuffle>(onShuffle);
    on<Back>(onGameBack);
  }

  Future onPuzzleChosen(ChoosePuzzle event, Emitter<PuzzleState> emit) async {
    emit(PuzzleChosenLoadingStart());
    //List<SliderPieces> sliderPiece;
    value = event.hCount;
    imgPath = event.imagePath;
    List<Image> croppedImage = <Image>[];
    double boardWidth = event.size;
    Size puzzleElementSize = Size(boardWidth / value, boardWidth / value);

    //for Crop Image
    FileToCroppedImage fileToCroppedImage = FileToCroppedImage(
        assetPath: event.imagePath, vCount: event.vCount, hCount: event.hCount);
    List<Uint8List> loadedCroppedImage =
        await fileToCroppedImage.cropperImage();
    for (Uint8List croppy in loadedCroppedImage) {
      croppedImage.add(
        Image.memory(
          croppy,
        ),
      );
    }
    sliderPiece = List.generate(value * value, (index) {
      Offset tempOffset = Offset(index % value * puzzleElementSize.width,
          index ~/ value * puzzleElementSize.width);

      return SliderPieces(
        posDefault: tempOffset,
        posCurrent: tempOffset,
        indexDefault: index + 1,
        indexCurrent: index,
        size: puzzleElementSize,
        image: croppedImage[index],
      );
    });
    sliderPiece.last.empty = true;
    bool swap = true;
    process = [];

    for (var i = 0; i < value * 20; i++) {
      for (var j = 0; j < value / 2; j++) {
        SliderPieces emptyObject =
            sliderPiece.firstWhere((element) => element.empty);
        int emptyIndex = emptyObject.indexCurrent;
        process.add(emptyIndex);
        int randKey;
        if (swap) {
          int row = emptyIndex ~/ value;
          randKey = row * value + Random().nextInt(value);
        } else {
          int col = emptyIndex % value;
          randKey = value * Random().nextInt(value) + col;
        }
        changePos(randKey, sliderPiece, value);
        swap = !swap;
      }
    }

    emit(PuzzleChosenLoadingEnded());
    emit(
      PuzzleChosenFirstGame(sliderPiece, event.imagePath),
    );
  }

  onGameEngine(ChangePos event, Emitter<PuzzleState> emit) {
    List<SliderPieces> sliderPiece = event.sliderPieces;
    emit(PuzzleLoop(sliderPiece));

    changePos(event.indexCurrent, sliderPiece, value);

    if (sliderPiece
            .where((slideObject) =>
                slideObject.indexCurrent == slideObject.indexDefault - 1)
            .length ==
        sliderPiece.length) {
      print("Success");
      emit(
        PuzzleWin(),
      );
      success = true;
    } else {
      success = false;
      moves++;
    }

    emit(PuzzleEngineLoop(sliderPiece, moves));
  }

  FutureOr<void> onShuffle(Shuffle event, Emitter<PuzzleState> emit) {
    moves = 0;
    List<SliderPieces> sliderPiece = event.sliderPieces;
    // sliderPiece.last.empty = true;
    bool swap = true;
    process = [];

    for (var i = 0; i < value * 20; i++) {
      for (var j = 0; j < value / 2; j++) {
        SliderPieces emptyObject =
            sliderPiece.firstWhere((element) => element.empty);
        int emptyIndex = emptyObject.indexCurrent;
        process.add(emptyIndex);
        int randKey;
        if (swap) {
          int row = emptyIndex ~/ value;
          randKey = row * value + Random().nextInt(value);
        } else {
          int col = emptyIndex % value;
          randKey = value * Random().nextInt(value) + col;
        }
        changePos(randKey, sliderPiece, value);
        swap = !swap;
      }
    }

    emit(PuzzleShuffle(sliderPiece, moves));
    emit(PuzzleChosenFirstGame(sliderPiece, imgPath));
  }

  FutureOr<void> onGameBack(Back event, Emitter<PuzzleState> emit) {
    // sliderPiece = <SliderPieces>[];
    // value = 0;
    // moves = 0;
    // imgPath = '';

    emit(GameBack());
  }
}
