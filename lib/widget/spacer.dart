import 'package:flutter/material.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({
    Key? key,
    required this.size,
    required this.widthPercentage,
    required this.heightPercentage,
  }) : super(key: key);

  final Size size;
  final double widthPercentage, heightPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width * widthPercentage,
        height: size.height * heightPercentage);
  }
}