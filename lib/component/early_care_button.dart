import 'package:early_care/component/color_info.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCareButton extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final double fontSize;
  final double width;
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool isActivated;
  final bool isBorder;
  final bool isPlus;
  final FontWeight fontWeight;
  final double radius;
  final Function()? onPressed;

  const EarlyCareButton({
    super.key,
    required this.text,
    this.padding,
    this.fontSize = 20,
    this.width = double.infinity,
    this.height,
    this.backgroundColor = ColorInfo.mainColor,
    this.textColor = ColorInfo.white,
    this.borderColor = Colors.black,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isActivated = true,
    this.isBorder = false,
    this.isPlus = false,
    this.fontWeight = FontWeight.bold,
    this.radius = 16,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 15,horizontal: 12
              ),
          shape: RoundedRectangleBorder(
            side: !isBorder
                ? BorderSide.none
                : BorderSide(
                    color: borderColor,
                  ),
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); //() : 함수 실행의미
          }
        },
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            !isPlus ? const SizedBox() : Container(
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                Assets.imagesIconPlus,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
