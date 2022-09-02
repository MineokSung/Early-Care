import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onPressed;
  final String? desc;

  const Button({
    super.key,
    required this.text,
    this.padding,
    this.fontSize = 10,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor ?? ColorInfo.mainColor,
      ),
      onPressed: onPressed,
      child: Text(
        desc ?? '',
        style: TextStyle(
          color: textColor ?? ColorInfo.white,
          fontSize: fontSize
        ),
      ),
    );
  }

}