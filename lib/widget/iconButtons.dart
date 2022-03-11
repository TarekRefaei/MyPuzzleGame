import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.color,
    required this.icon, required this.function,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white54,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.white54,
        splashColor: Colors.blueGrey,
        onPressed: function,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
