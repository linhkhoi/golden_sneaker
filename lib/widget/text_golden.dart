import 'package:flutter/material.dart';

class TextGolden extends StatelessWidget {
  double size;
  String text;
  Color color;
  bool isBold;
  TextGolden({required this.text, required this.color, required this.size, required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: isBold?FontWeight.bold:FontWeight.normal
      ),
    );
  }
}
