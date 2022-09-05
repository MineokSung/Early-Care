import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:flutter/material.dart';

class EarlyCareDialogNonConfirm extends StatelessWidget {
  final String title;
  final String information;
  final String? correct;
  final Color? titleColor;
  final Color? informationColor;
  final Color? correctColor;
  final Color? correctBackgroundColor;
  final double? titleFontSize;
  final double? informationFontSize;
  final double? buttonFontSize;
  final EdgeInsets? titlePadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? actionPadding;
  final Widget? widget;
  final Function()? correctOnPressed;

  const EarlyCareDialogNonConfirm({
    super.key,
    required this.title,
    required this.information,
    this.correct,
    this.titleColor,
    this.informationColor,
    this.correctColor,
    this.correctBackgroundColor,
    this.titleFontSize,
    this.informationFontSize,
    this.buttonFontSize,
    this.titlePadding,
    this.contentPadding,
    this.actionPadding,
    this.widget,
    this.correctOnPressed,
  });

  Widget inputWidget() {
    if (widget != null) {
      return widget!;
    }

    return const SizedBox.shrink();
  }

  Widget buttonInfo() {
    return SizedBox(
      width: double.infinity,
      child: EarlyCareButton(
        width: double.infinity,
        text: correct ?? '확인',
        textColor: correctColor,
        fontSize: buttonFontSize,
        backgroundColor: correctBackgroundColor,
        onPressed: correctOnPressed,
      ),
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
        buttonInfo(),
      ],
    );
  }
}
