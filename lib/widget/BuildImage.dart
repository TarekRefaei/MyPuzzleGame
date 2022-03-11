import 'package:flutter/material.dart';

Widget buildImage(String urlImage, int index) {
  return Column(
    children: [
      Flexible(
        flex: 10,
        child: Image.asset(urlImage),
      ),
    ],
  );
}
