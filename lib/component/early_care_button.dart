import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareButton extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final double? fontSize;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onPressed;

  const EarlyCareButton({
    super.key,
    required this.text,
    this.padding,
    this.fontSize = 10,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? ColorInfo.mainColor,
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); //() : 함수 실행의미
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? ColorInfo.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
