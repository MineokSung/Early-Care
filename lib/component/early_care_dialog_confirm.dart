import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  final String information;
  final String? correct;
  final String? cancel;
  final Color? titleColor;
  final Color? informationColor;
  final Color? correctColor;
  final Color? cancelColor;
  final Color? correctBackgroundColor;
  final Color? cancelBackgroundColor;
  final double? titleFontSize;
  final double? informationFontSize;
  final double? buttonFontSize;
  final EdgeInsets? titlePadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? actionPadding;
  final bool? isHorizontal;
  final Widget? widget;
  final Function()? correctOnPressed;
  final Function()? cancelOnPressed;

  const DialogConfirm({
    super.key,
    required this.title,
    required this.information,
    this.correct,
    this.cancel,
    this.titleColor,
    this.informationColor,
    this.correctColor,
    this.cancelColor,
    this.correctBackgroundColor,
    this.cancelBackgroundColor,
    this.titleFontSize,
    this.informationFontSize,
    this.buttonFontSize,
    this.titlePadding,
    this.contentPadding,
    this.actionPadding,
    this.isHorizontal,
    this.widget,
    this.correctOnPressed,
    this.cancelOnPressed,
  });

  Widget inputWidget() {
    if (widget != null) {
      return widget!;
    }

    return const SizedBox.shrink();
  }

  Widget buttons() {
    if (isHorizontal == true) {
      return Row(
        children: [
          Expanded(
            child: EarlyCareButton(
              text: cancel ?? '취소',
              textColor: cancelColor,
              fontSize: buttonFontSize,
              backgroundColor: cancelBackgroundColor,
              onPressed: ()=> cancelOnPressed,
            ),
          ),
          Expanded(
            child: EarlyCareButton(
              text: correct ?? '확인',
              textColor: correctColor,
              fontSize: buttonFontSize,
              backgroundColor: correctBackgroundColor,
              onPressed: ()=> correctOnPressed,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: EarlyCareButton(
            width: double.infinity,
            text: cancel ?? '취소',
            textColor: cancelColor,
            fontSize: buttonFontSize,
            backgroundColor: cancelBackgroundColor,
            onPressed: cancelOnPressed,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: EarlyCareButton(
            width: double.infinity,
            text: correct ?? '확인',
            textColor: correctColor,
            fontSize: buttonFontSize,
            backgroundColor: correctBackgroundColor,
            onPressed: correctOnPressed,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: titlePadding ?? const EdgeInsets.only(top: 32, left: 24, right: 24),
      contentPadding: contentPadding ?? const EdgeInsets.only(top: 2, left: 24, right: 24),
      actionsPadding: actionPadding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: titleColor,
            ),
          ),

        ],
      ),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                information,
                style: TextStyle(
                  fontSize: informationFontSize,
                  color: informationColor,
                ),
              ),
              inputWidget(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buttons(),
      ],
    );
  }
}
