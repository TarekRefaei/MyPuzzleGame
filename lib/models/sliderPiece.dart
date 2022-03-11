import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SliderPieces extends Equatable {
  // setup offset for default / current position
  Offset posDefault;
  Offset posCurrent;

  // setup index for default / current position
  int indexDefault;
  int indexCurrent;

  // status box is empty
  bool empty;

  // size each box
  final Size size;

  // Image field for crop later
  final Image image;

  SliderPieces(
      {required this.posDefault,
      required this.posCurrent,
      required this.indexDefault,
      required this.indexCurrent,
      this.empty = false,
      required this.size,
      required this.image});

  @override
  List<Object?> get props => [indexCurrent,indexDefault];
}
