import 'dart:ui';
import 'package:flutter/material.dart';
import 'color_info.dart';

class Button extends StatelessWidget {
  double verticalPadding = 0;
  double horizontalPadding = 0;
  String text = "";
  double fontSize = 10;
  Color backgroundColor = ColorInfo.mainColor;
  Color textColor = ColorInfo.white;

  Button(this.verticalPadding, this.horizontalPadding, this.text, this.fontSize, this.backgroundColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding:EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        primary: backgroundColor,
      ),
      onPressed: () {  },
      child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize),
      ),
    );
  }

}