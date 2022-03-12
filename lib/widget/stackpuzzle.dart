import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_puzzle_game/constants/values.dart';
import '../models/sliderPiece.dart';
import '../puzzlebloc/puzzle_bloc.dart';

class PuzzleStackBoard extends StatelessWidget {
  const PuzzleStackBoard({
    Key? key,
    required this.puzzlePiecesList,
    required this.isSuccess,
  }) : super(key: key);

  final List<SliderPieces> puzzlePiecesList;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...[
          Container(
            color: Colors.transparent,
            height: double.maxFinite,
          ),
        ],
        //where((element) => element.empty).map((element)
        ...puzzlePiecesList.where((element) => element.empty).map((element) {
          return Positioned(
            top: element.posCurrent.dx,
            left: element.posCurrent.dy,
            child: SizedBox(
              width: element.size.width,
              height: element.size.height,
              child: Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ...[
                      Opacity(
                        opacity: isSuccess ? 1 : 0.0,
                        child: element.image,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        }),
        ...puzzlePiecesList.where((element) => !element.empty).map((element) {
          return AnimatedPositioned(
            left: element.posCurrent.dx,
            top: element.posCurrent.dy,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: () {
                context.read<PuzzleBloc>().add(
                      ChangePos(
                          indexCurrent: element.indexCurrent,
                          sliderPieces: puzzlePiecesList),
                    );
              },
              child: SizedBox(
                width: element.size.width,
                height: element.size.height,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      element.image,
                      kText('${element.indexDefault}', 35, Colors.black,
                          TextAlign.start),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
