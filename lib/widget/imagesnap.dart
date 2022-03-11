import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../puzzlebloc/puzzle_bloc.dart';

class ChosenImageSnapShot extends StatelessWidget {
  ChosenImageSnapShot({Key? key, required this.size}) : super(key: key);

  final Size size;
  String imgPath = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        if (state is PuzzleChosenFirstGame) {
          imgPath = state.imageChosen;
          return Container(
            color: Colors.white54,
            width: size.width * 0.4,
            height: size.width * 0.4,
            child: FittedBox(
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (state is PuzzleEngineLoop) {
          return Container(
            color: Colors.white54,
            width: size.width * 0.4,
            height: size.width * 0.4,
            child: FittedBox(
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (state is PuzzleEngineLoop) {
          return Container(
            color: Colors.white54,
            width: size.width * 0.4,
            height: size.width * 0.4,
            child: FittedBox(
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (state is PuzzleShuffle) {
          return Container(
            color: Colors.white54,
            width: size.width * 0.4,
            height: size.width * 0.4,
            child: FittedBox(
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else {
          return const Text('Wrong');
        }
      },
    );
  }
}
