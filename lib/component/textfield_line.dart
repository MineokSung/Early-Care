import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class TextFieldLine extends StatelessWidget {
  final EdgeInsets? padding;
  final String? hint;
  final String? label;
  final String? prefix;
  final String? suffix;
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
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextAlign? textInputAlign;
  final FontWeight? fontWeight;
  final Widget? widget;

  const TextFieldLine({
    super.key,
    this.hint,
    this.label,
    this.prefix = '',
    this.suffix = '',
    this.width,
    this.fontWeight,
    this.labelSize,
    this.padding,
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
    this.focusNode,
    this.textInputAlign,
    this.textInputType,
    this.widget,
  });

  Widget prefixLine() {
    if (prefix == '') {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: prefixWidth ?? 50,
        height: prefixHeight ?? 20,
        child: Text(prefix!),
      ),
    );
  }

  Widget suffixLine() {
    if (suffix == '') {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: suffixWidth ?? 50,
        height: suffixHeight ?? 20,
        child: Text(suffix!),
      ),
    );
  }

  InputBorder underlineInfo(int type) //1 = enableBorderline, 2 = focusBorderline
  {
    if (isUnderline == false) {
      return InputBorder.none;
    }
    else if (type == 1) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: enableBorderColor ?? Colors.grey),
      );
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: focusBorderColor ?? ColorInfo.mainColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: textInputAlign ?? TextAlign.left,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize,
          textBaseline: TextBaseline.alphabetic,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: padding,
          prefixIcon: prefixLine(),
          prefixIconConstraints:
          const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: suffixLine(),
          suffixIconConstraints:
          const BoxConstraints(minWidth: 0, minHeight: 0),
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
}
