import 'package:flutter/material.dart';

import '../constants/values.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key, required this.size, required this.bannerTitle})
      : super(key: key);

  final Size size;
  final String bannerTitle;

  @override
  Widget build(BuildContext context) {
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
          //need Some Improvements
          child: SizedBox(
            height: size.height * 0.06,
            width: size.width * 0.6,
            child: Center(
              child: kText(
                bannerTitle,
                30.0,
                Colors.black,
                TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
