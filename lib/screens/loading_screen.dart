import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_puzzle_game/screens/game_board_screen.dart';
import 'package:my_puzzle_game/screens/game_choose_screen.dart';

import '../puzzlebloc/puzzle_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (context, state) {
        if (state is PuzzleChosenLoadingEnded) {
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameBoard(),
                ),
              );
            },
          );
        }
        if(state is GameBack){
          Timer(
            const Duration(seconds: 3),
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameChoose(),
                ),
              );
            },
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
