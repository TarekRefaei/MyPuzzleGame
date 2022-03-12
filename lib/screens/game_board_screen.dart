import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_puzzle_game/models/sliderPiece.dart';
import 'package:my_puzzle_game/screens/loading_screen.dart';
import 'package:my_puzzle_game/widget/gameBackGround.dart';
import 'package:my_puzzle_game/widget/windialog.dart';
import '../puzzlebloc/puzzle_bloc.dart';
import '../widget/iconButtons.dart';
import '../widget/imagesnap.dart';
import '../widget/myTitle.dart';
import '../widget/stackpuzzle.dart';
import '../widget/timermovespanel.dart';

class GameBoard extends StatelessWidget {
  GameBoard({Key? key}) : super(key: key);
  List<SliderPieces> puzzlePiecesList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (context, state) {
        if (state is GameBack) {
          Navigator.pop(context);
        }
        if (state is PuzzleWin) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Winner()),
          );
        }
        if (state is AnotherGame) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
          );
        }
      },
      child: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Scaffold(
              body: Stack(
                children: [
                  GameBackground(size: size),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              function: () {
                                context.read<PuzzleBloc>().add(Back());
                              },
                              icon: Icons.arrow_back,
                              color: Colors.black,
                            ),
                            HeaderTitle(
                              size: size * 0.8,
                              bannerTitle: 'Game Board',
                            ),
                            CustomIconButton(
                              function: () {
                                context.read<PuzzleBloc>().add(
                                    Shuffle(sliderPieces: puzzlePiecesList));
                              },
                              icon: Icons.refresh,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: size.width,
                            height: size.width,
                            child: BlocBuilder<PuzzleBloc, PuzzleState>(
                              builder: (context, state) {
                                if (state is PuzzleChosenFirstGame) {
                                  puzzlePiecesList = state.sliderPieces;
                                  return PuzzleStackBoard(
                                    puzzlePiecesList: puzzlePiecesList,
                                    isSuccess: false,
                                  );
                                } else if (state is PuzzleShuffle) {
                                  puzzlePiecesList = state.sliderPieces;
                                  return PuzzleStackBoard(
                                    puzzlePiecesList: puzzlePiecesList,
                                    isSuccess: false,
                                  );
                                } else if (state is PuzzleEngineLoop) {
                                  puzzlePiecesList = state.sliderPieces;
                                  return PuzzleStackBoard(
                                    puzzlePiecesList: puzzlePiecesList,
                                    isSuccess: false,
                                  );
                                } else if (state is PuzzleLoop) {
                                  puzzlePiecesList = state.sliderPieces;
                                  return PuzzleStackBoard(
                                    puzzlePiecesList: puzzlePiecesList,
                                    isSuccess: false,
                                  );
                                } else {
                                  return const Text("null");
                                }
                              },
                            ),
                          ),
                        ),
                        TimerMovesPanel(
                          size: size,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChosenImageSnapShot(size: size),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
