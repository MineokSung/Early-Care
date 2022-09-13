import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareTextFieldBox extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? prefixPadding;
  final EdgeInsets? suffixPadding;
  final String? hint;
  final String? label;
  final String? helperText;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? labelSize;
  final double? helperTextSize;
  final double? boxBorderRadius;
  final bool? isSecret;
  final bool? isBoxBorderLine;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? boxColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? helperTextColor;
  final Function()? prefixOnTap;
  final Function()? suffixOnTap;
  final TextEditingController? controller;
  final int? maxLine;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextAlign? textInputAlign;
  final FontWeight? fontWeight;
  final Widget? widget;
  final Function(String)? onChanged;

  const EarlyCareTextFieldBox({
    super.key,
    this.hint,
    this.label,
    this.helperText,
    this.prefix,
    this.suffix,
    this.width,
    this.height,
    this.fontWeight,
    this.labelSize,
    this.helperTextSize,
    this.padding,
    this.prefixPadding,
    this.suffixPadding,
    this.fontSize = 10,
    this.controller,
    this.boxBorderRadius,
    this.isSecret,
    this.isBoxBorderLine = true,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.boxColor,
    this.enableBorderColor,
    this.focusBorderColor,
    this.helperTextColor,
    this.prefixOnTap,
    this.suffixOnTap,
    this.maxLine,
    this.focusNode,
    this.textInputAlign,
    this.textInputType,
    this.widget,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor ?? Colors.grey,
        borderRadius: BorderRadius.circular(boxBorderRadius ?? 10),
        //border: Border.all(color: enableBorderColor ?? ColorInfo.silver),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          label == null
              ? const SizedBox()
              : Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    label!,
                    style: TextStyle(color: labelColor ?? ColorInfo.red, fontSize: labelSize ?? 12),
                  ),
                ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: _textAlign(),
              controller: controller,
              maxLines: maxLine ?? 1,
              onChanged: (String value) {
                if (onChanged != null) {
                  onChanged!(value);
                }
              },
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: fontSize,
                textBaseline: TextBaseline.alphabetic,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 18,),
                prefixIcon: prefix == null ? null : _prefixLine(),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                suffixIcon: suffix == null ? null : _suffixLine(),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: fontSize,
                ),
                enabledBorder: _underlineInfo(1),
                focusedBorder: _underlineInfo(2),
                border: InputBorder.none,
              ),
              obscureText: isSecret ?? false,
              keyboardType: textInputType ?? TextInputType.text,
              focusNode: focusNode,
            ),
          ),
          helperText == null
              ? const SizedBox()
              : Align(
            alignment: Alignment.topLeft,
            child: Text(
              helperText!,
              style: TextStyle(color: helperTextColor ?? ColorInfo.silver, fontSize: helperTextSize ?? 12),
            ),
          ),
        ],
      ),
    );
  }

  TextAlign _textAlign(){
    if(textInputAlign != null){
      return textInputAlign!;
    }
    if(suffix == null && prefix == null){
      return TextAlign.center;
    }
    return TextAlign.left;
  }

  Widget _prefixLine() {
    if (prefix == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Padding(
        padding: prefixPadding ?? const EdgeInsets.only(left: 15),
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

  Widget _suffixLine() {
    if (suffix == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Padding(
        padding: suffixPadding ?? const EdgeInsets.only(right: 15),
        child: GestureDetector(
          child: suffix!,
          // onTap: () {
          //   if (suffixTouch != null) {
          //     suffixTouch!();
          //   }
          // },
          onTap: () => suffixOnTap != null ? suffixOnTap!() : null,
        ),
      ),
    );
  }

  InputBorder _underlineInfo(int type) {
    //1 = enableBorderline, 2 = focusBorderline
    if (!isBoxBorderLine!) {
      return InputBorder.none;
    } else if (type == 1) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: enableBorderColor ?? ColorInfo.silver, width: 1),
      );
    }
    return OutlineInputBorder(
      borderSide: BorderSide(color: focusBorderColor ?? ColorInfo.mainColor, width: 1),
    );
  }
}
