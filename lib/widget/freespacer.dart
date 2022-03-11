import 'package:flutter/material.dart';

class FreeSpacer extends StatelessWidget {
  const FreeSpacer({
    Key? key, required this.height, required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}