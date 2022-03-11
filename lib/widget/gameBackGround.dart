import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backGround/bakGround.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.white30,
          width: size.width,
          height: size.height,
        ),
      ],
    );
  }
}
