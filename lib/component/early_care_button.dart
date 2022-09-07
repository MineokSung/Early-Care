import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareButton extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final double? fontSize;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? clickBackgroundColor;
  final Color? clickTextColor;
  final Color? textColor;
  final Color? borderColor;
  final Alignment? alignment;
  final bool? isActivated;
  final bool? isBorder;
  final FontWeight? fontWeight;
  final double? radius;
  final Function()? onPressed;

  const EarlyCareButton({
    super.key,
    required this.text,
    this.padding,
    this.fontSize,
    this.width,
    this.height,
    this.backgroundColor,
    this.clickBackgroundColor,
    this.clickTextColor,
    this.textColor,
    this.borderColor,
    this.alignment,
    this.isActivated,
    this.isBorder = false,
    this.fontWeight,
    this.radius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 15,
              ),
          shape: RoundedRectangleBorder(
            side: isBorder == false ? BorderSide.none : BorderSide(
                    color: borderColor ?? Colors.black,
                  ),
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
          backgroundColor: backgroundColor ?? ColorInfo.mainColor,
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); //() : 함수 실행의미

          }
        },
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? ColorInfo.white,
              fontSize: fontSize ?? 20,
              fontWeight: fontWeight ?? FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
