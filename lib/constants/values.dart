import 'package:flutter/material.dart';

Material kText(
    String string, double fontSize, Color color, TextAlign textAlign) {
  return Material(
    color: Colors.transparent,
    child: Text(
      string,
      textAlign: textAlign,
      overflow: TextOverflow.visible,
      softWrap: true,
      style: TextStyle(
        fontFamily: 'OdibeeSans',
        fontSize: fontSize,
        color: color,
      ),
    ),
  );
}

enum LevelValues {
  easy,
  medium,
  hard,
  test,
}

const String splashGameTitle = 'Slider Puzzle Game';
const String chooseImage = 'Choose Image';
const String chooseLevel = 'Choose Level';

const String splashImagePath = 'assets/splashLogo/movingSlides.gif';
