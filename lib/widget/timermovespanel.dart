import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/values.dart';
import '../puzzlebloc/puzzle_bloc.dart';

class TimerMovesPanel extends StatelessWidget {
  const TimerMovesPanel({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    int moves = 0;
    int seconds = 0;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 40.0,
          shadowColor: Colors.grey[800],
          color: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width,
            child: BlocBuilder<PuzzleBloc, PuzzleState>(
              builder: (context, state) {
                if (state is PuzzleChosenFirstGame){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      kText('Moves', 30, Colors.black, TextAlign.center),
                      kText(
                          '0', 30, Colors.black, TextAlign.center),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  );
                }
                else if (state is PuzzleEngineLoop) {
                  moves = state.moves;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      kText('Moves', 30, Colors.black, TextAlign.center),
                      kText(
                          moves.toString(), 30, Colors.black, TextAlign.center),
                      const SizedBox(
                        width: 15,
                      ),
                      // kText('Timer', 30, Colors.black, TextAlign.center),
                      // kText(seconds.toString(), 30, Colors.black, TextAlign.center),
                    ],
                  );
                }
                else if (state is PuzzleLoop) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      kText('Moves', 30, Colors.black, TextAlign.center),
                      kText(
                          moves.toString(), 30, Colors.black, TextAlign.center),
                      const SizedBox(
                        width: 15,
                      ),
                      // kText('Timer', 30, Colors.black, TextAlign.center),
                      // kText(seconds.toString(), 30, Colors.black, TextAlign.center),
                    ],
                  );
                }
                else if (state is PuzzleShuffle) {
                  moves = state.moves;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      kText('Moves', 30, Colors.black, TextAlign.center),
                      kText(
                          moves.toString(), 30, Colors.black, TextAlign.center),
                      const SizedBox(
                        width: 15,
                      ),
                      // kText('Timer', 30, Colors.black, TextAlign.center),
                      // kText('', 30, Colors.black, TextAlign.center),
                    ],
                  );
                }
                else {
                  return const Text('data');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}


