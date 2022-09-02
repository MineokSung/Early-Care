import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class TextFieldLine extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final String? hint;
  final String? label;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? isSecret;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final FocusNode? focusNode;
  final Widget? widget;

  const TextFieldLine({
    super.key,
    required this.text,
    this.hint,
    this.label,
    this.fontWeight,
    this.padding,
    this.fontSize = 10,
    this.isSecret,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.focusNode,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
          decoration: InputDecoration(
            contentPadding: padding,
            labelText: label,
            labelStyle: TextStyle(
              color: labelColor,/////
              fontSize: fontSize,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: fontSize,
            ),
            fillColor: textColor,
          ),
          obscureText: isSecret ?? false,
          focusNode: focusNode,
        ),
      ],
    );
  }

}