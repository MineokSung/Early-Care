import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:flutter/material.dart';

class EarlyCareDialogConfirm extends StatelessWidget {
  final String? title;
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
  final bool? isConfirm;
  final Widget? widget;
  final Function()? correctOnPressed;
  final Function()? cancelOnPressed;

  const EarlyCareDialogConfirm({
    super.key,
    this.title,
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
    this.isConfirm = true,
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

  EdgeInsets contentPaddingInfo() {
    if (contentPadding != null) {
      return contentPadding!;
    } else if (title == null) {
      return const EdgeInsets.only(top: 40, bottom: 30, left: 45, right: 45);
    }
    return const EdgeInsets.only(top: 20, bottom: 30, left: 45, right: 45);
  }

  Widget buttonsInfo() {
    if (isConfirm == true) {
      //single confirm button
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
    if (isHorizontal == true) {
      //horizontal confirm button and cancel button
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: EarlyCareButton(
              text: cancel ?? '취소',
              textColor: cancelColor,
              fontSize: buttonFontSize,
              backgroundColor: cancelBackgroundColor,
              onPressed: () => cancelOnPressed,
            ),
          ),
          Expanded(
            flex: 1,
            child: EarlyCareButton(
              text: correct ?? '확인',
              textColor: correctColor,
              fontSize: buttonFontSize,
              backgroundColor: correctBackgroundColor,
              onPressed: () => correctOnPressed,
            ),
          ),
        ],
      );
    }
    return Column(
      //vertical confirm button and cancel button
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
      titlePadding: title == null
          ? EdgeInsets.zero
          : const EdgeInsets.only(top: 40, left: 45, right: 45),
      contentPadding: contentPaddingInfo(),
      actionsPadding: actionPadding ??
          const EdgeInsets.only(bottom: 40, left: 45, right: 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: title == null
          ? null
          : Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                color: titleColor,
              ),
            ),
      // content: ConstrainedBox(
      //   constraints: const BoxConstraints(
      //     maxHeight: 70,
      //   ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 300,
                minHeight: 10,
              ),
              child: SingleChildScrollView(
                child: Text(
                  information,
                  style: TextStyle(
                    fontSize: informationFontSize,
                    color: informationColor,
                  ),
                ),
              ),
            ),
            inputWidget(),
          ],
        ),

      actions: <Widget>[
        buttonsInfo(),
      ],
    );
  }
}
