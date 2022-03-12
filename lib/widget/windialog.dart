import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_puzzle_game/widget/freespacer.dart';
import 'package:my_puzzle_game/widget/gameBackGround.dart';
import '../constants/values.dart';
import '../puzzlebloc/puzzle_bloc.dart';
import 'iconButtons.dart';

class Winner extends StatelessWidget {
  const Winner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const GameBackground(
            size: Size.infinite,
          ),
          Dialog(
            child: Wrap(
              children: [
                Center(
                  child: kText('You Win', 35, Colors.black, TextAlign.start),
                ),
                Lottie.asset('assets/animation/win.json'),
                Row(
                  children: [
                    CustomIconButton(
                      color: Colors.black,
                      icon: Icons.add,
                      function: () {
                        context.read<PuzzleBloc>().add(NewGame());
                      },
                    ),
                    const FreeSpacer(height: 0, width: 20),
                    const Text('Start New Game'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
