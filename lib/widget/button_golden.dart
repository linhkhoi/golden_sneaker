import 'package:flutter/material.dart';

class ButtonGolden extends StatelessWidget {
  final Color color;
  String text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;
  final VoidCallback onPress;
  ButtonGolden({required this.isIcon, required this.text, this.icon, required this.size, required this.color, required this.backgroundColor, required this.borderColor, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return isIcon?
    ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
        ),
        child: Icon(icon, size: size,)
    )
    :
    ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(

            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
        ),
        child: Text(text)
    );
  }
}
