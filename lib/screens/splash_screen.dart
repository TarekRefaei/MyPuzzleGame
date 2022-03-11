import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_puzzle_game/constants/values.dart';
import 'package:my_puzzle_game/screens/game_choose_screen.dart';
import 'package:my_puzzle_game/widget/gameBackGround.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    Timer(
      const Duration(seconds: 8),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              //GameBackground(size: size),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image(
                      image: AssetImage(splashImagePath),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  kText(splashGameTitle, 40, Colors.black, TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
