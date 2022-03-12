import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../constants/values.dart';
import '../puzzlebloc/puzzle_bloc.dart';
import 'iconButtons.dart';

class Winner extends StatelessWidget {
  const Winner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        if(state is PuzzleWin){
          return Dialog(
            child: Wrap(
              children: [
                Center(
                  child: kText(
                      'You Win', 35, Colors.black, TextAlign.start),
                ),
                Lottie.asset('assets/animation/win.json'),
                Row(
                  children: [
                    CustomIconButton(
                      color: Colors.black,
                      icon: Icons.add,
                      function: () {
                        context.read<PuzzleBloc>().add(Back());
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }
}
