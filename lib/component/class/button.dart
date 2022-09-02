import 'dart:ui';
import 'package:flutter/material.dart';
import 'color_info.dart';

class Button extends StatelessWidget {
  double verticalPadding;
  double horizontalPadding;
  String text;
  double fontSize;
  Color backgroundColor;
  Color textColor;

  //Button(this.verticalPadding, this.horizontalPadding, this.text, this.fontSize, this.backgroundColor, this.textColor);
  Button(this.text, this.fontSize, this.backgroundColor, this.textColor, {this.verticalPadding = 10, this.horizontalPadding = 10});


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