import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareTextFieldBox extends StatelessWidget {
  final EdgeInsets? padding;
  final String? hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? labelSize;
  final double? prefixWidth;
  final double? prefixHeight;
  final double? suffixWidth;
  final double? suffixHeight;
  final double? boxBorderRadius;
  final bool? isSecret;
  final bool? isUnderline;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? boxColor;
  final Function()? prefixOnTap;
  final Function()? suffixOnTap;
  final TextEditingController? controller;
  final int? maxLine;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextAlign? textInputAlign;
  final FontWeight? fontWeight;
  final Widget? widget;

  const EarlyCareTextFieldBox({
    super.key,
    this.hint,
    this.label,
    this.prefix,
    this.suffix,
    this.width,
    this.height,
    this.fontWeight,
    this.labelSize,
    this.padding,
    this.fontSize = 10,
    this.prefixWidth,
    this.prefixHeight,
    this.suffixWidth,
    this.suffixHeight,
    this.controller,
    this.boxBorderRadius,
    this.isSecret,
    this.isUnderline = true,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.boxColor,
    this.prefixOnTap,
    this.suffixOnTap,
    this.maxLine,
    this.focusNode,
    this.textInputAlign,
    this.textInputType,
    this.widget,
  });

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
        child: GestureDetector(
          child: prefix!,
          onTap: () {
            if (prefixOnTap != null) {
              prefixOnTap!();
            }
          },
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
        child: GestureDetector(
          child: suffix!,
          // onTap: () {
          //   if (suffixTouch != null) {
          //     suffixTouch!();
          //   }
          // },
          onTap: ()=> suffixOnTap != null ? suffixOnTap!() : null,
        ),
      ),
    );
  }

  // InputBorder underlineInfo(int type) //1 = enableBorderline, 2 = focusBorderline
  // {
  //   if (isUnderline == false) {
  //     return InputBorder.none;
  //   }
  //   else if (type == 1) {
  //     return UnderlineInputBorder(
  //       borderSide: BorderSide(color: enableBorderColor ?? Colors.grey),
  //     );
  //   }
  //   return UnderlineInputBorder(
  //     borderSide: BorderSide(color: focusBorderColor ?? ColorInfo.mainColor),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor ?? Colors.grey,
        borderRadius: BorderRadius.circular((boxBorderRadius ?? 10)),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: textInputAlign ?? TextAlign.left,
        controller: controller,
        maxLines: maxLine ?? 1,
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
          border: InputBorder.none,
        ),
        obscureText: isSecret ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        focusNode: focusNode,
      ),
    );
  }
}
