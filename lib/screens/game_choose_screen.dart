import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_puzzle_game/constants/values.dart';
import 'package:my_puzzle_game/screens/game_board_screen.dart';
import 'package:my_puzzle_game/screens/loading_screen.dart';
import 'package:my_puzzle_game/widget/gameBackGround.dart';
import 'package:my_puzzle_game/widget/myTitle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../puzzlebloc/puzzle_bloc.dart';
import '../widget/BuildImage.dart';

class GameChoose extends StatefulWidget {
  const GameChoose({Key? key}) : super(key: key);

  @override
  _GameChooseState createState() => _GameChooseState();
}

class _GameChooseState extends State<GameChoose> {
  //for Buttons
  static const int test = 2;
  static const int easy = 3;
  static const int medium = 4;
  static const int hard = 5;

  //for Screen Size
  late Size size;

  final imageAssets = [
    'assets/gameImages/1.png',
    'assets/gameImages/2.png',
    'assets/gameImages/3.png',
    'assets/gameImages/4.png',
    'assets/gameImages/5.png',
    'assets/gameImages/6.jpg',
    'assets/gameImages/7.jpg',
    'assets/gameImages/8.jpg',
  ];

  //Default Values
  String urlImage = 'assets/gameImages/1.png';
  int value = easy;

  customRadioButton(String text, int index, Color btnColor) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 80,
          height: 80,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  color: (value == index) ? btnColor : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: (value == index)
                ? [
                    //bottom Right Shadow is darker
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: const Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 0.25,
                    ),
                    //top left shadow is lighter
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, -2),
                      blurRadius: 10,
                      spreadRadius: 0.25,
                    ),
                  ]
                : [
                    //bottom Right Shadow is darker
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: const Offset(10, 10),
                      blurRadius: 15,
                      spreadRadius: 0.25,
                    ),
                  ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocListener<PuzzleBloc, PuzzleState>(
        listener: (context, state) {
          if (state is PuzzleChosenLoadingStart) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoadingScreen()),
            );
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              GameBackground(size: size),
              Center(
                child: SizedBox(
                  width: size.width - 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderTitle(size: size, bannerTitle: 'Puzzle Game'),
                      kText(chooseImage, 30, Colors.black, TextAlign.center),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CarouselSlider.builder(
                          itemCount: imageAssets.length,
                          itemBuilder: (context, index, realIndex) {
                            return buildImage(imageAssets[index], index);
                          },
                          options: CarouselOptions(
                            height: size.height * 0.4,
                            enlargeCenterPage: true,
                            disableCenter: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              //indicate no of Image
                              urlImage = imageAssets[index];
                            },
                          ),
                        ),
                      ),
                      kText(chooseLevel, 30, Colors.black, TextAlign.center),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          customRadioButton('Test', test, Colors.blue),
                          customRadioButton('Easy', easy, Colors.green),
                          customRadioButton('Medium', medium, Colors.yellow),
                          customRadioButton('Hard', hard, Colors.red)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<PuzzleBloc>().add(
                                  ChoosePuzzle(
                                    imagePath: urlImage,
                                    hCount: value,
                                    vCount: value,
                                    size: size.width,
                                  ),
                                );
                          },
                          child: const Text('Start'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
