import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareTextFieldLine extends StatelessWidget {
  final EdgeInsets? textPadding;
  final EdgeInsets? textfieldPadding;
  final String? hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final double? fontSize;
  final double? labelSize;
  final double? prefixWidth;
  final double? prefixHeight;
  final double? suffixWidth;
  final double? suffixHeight;
  final bool? isSecret;
  final bool? isUnderline;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextAlign? textInputAlign;
  final FontWeight? fontWeight;
  final Widget? widget;

  const EarlyCareTextFieldLine({
    super.key,
    this.hint,
    this.label,
    this.prefix,
    this.suffix,
    this.width,
    this.fontWeight,
    this.labelSize,
    this.textPadding,
    this.textfieldPadding,
    this.fontSize = 10,
    this.prefixWidth,
    this.prefixHeight,
    this.suffixWidth,
    this.suffixHeight,
    this.isSecret,
    this.isUnderline = true,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.enableBorderColor,
    this.focusBorderColor,
    this.cursorColor,
    this.controller,
    this.focusNode,
    this.textInputAlign,
    this.textInputType,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: textfieldPadding ?? EdgeInsets.zero,
      width: width ?? double.infinity,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: textInputAlign ?? TextAlign.left,
        controller: controller,
        cursorColor: cursorColor ?? Colors.black,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: textPadding ?? const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: prefixLine(),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: suffixLine(),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: fontSize,
          ),
          labelText: label,
          labelStyle: TextStyle(color: labelColor, fontSize: labelSize),
          enabledBorder: underlineInfo(1),
          focusedBorder: underlineInfo(2),
        ),
        obscureText: isSecret ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        focusNode: focusNode,
      ),
    );
  }

  Widget prefixLine() {
    if (prefix == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: SizedBox(
        width: prefixWidth,
        height: prefixHeight,
        child: Container(
          color: Colors.blue,
          child: prefix!,
        ),
      ),
    );
  }

  Widget suffixLine() {
    if (suffix == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: SizedBox(
        width: suffixWidth,
        height: suffixHeight,
        child: suffix!,
      ),
    );
  }

  InputBorder underlineInfo(int type) //1 = enableBorderline, 2 = focusBorderline
  {
    if (isUnderline == false) {
      return InputBorder.none;
    } else if (type == 1) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: enableBorderColor ?? Colors.grey, width: 5),

      );
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: focusBorderColor ?? ColorInfo.mainColor, width: 5),
    );
  }
}
