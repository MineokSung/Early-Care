import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:flutter/material.dart';

class EarlyCareDialogConfirm extends StatelessWidget {
  final String? title;
  final String information;
  final String correct;
  final String cancel;
  final Color titleColor;
  final Color borderColor;
  final Color informationColor;
  final Color? correctColor;
  final Color? cancelColor;
  final Color? correctBackgroundColor;
  final Color cancelBackgroundColor;
  final double titleFontSize;
  final double informationFontSize;
  final double buttonFontSize;
  final double radius;
  final EdgeInsets? titlePadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? actionPadding;
  final bool isHorizontal;
  final bool isShowCancel;
  final bool isCorrectBorder;
  final bool isCancelBorder;
  final Widget? widget;
  final Function()? correctOnPressed;
  final Function()? cancelOnPressed;

  const EarlyCareDialogConfirm({
    super.key,
    this.title,
    required this.information,
    this.correct = '확인',
    this.cancel = '취소',
    this.titleColor = Colors.black,
    this.borderColor = ColorInfo.silver,
    this.informationColor = ColorInfo.silver,
    this.correctColor,
    this.cancelColor,
    this.correctBackgroundColor,
    this.cancelBackgroundColor = Colors.white,
    this.titleFontSize = 20,
    this.informationFontSize = 17,
    this.buttonFontSize = 17,
    this.radius = 8,
    this.titlePadding,
    this.contentPadding,
    this.actionPadding,
    this.isHorizontal = false,
    this.isShowCancel = false,
    this.isCorrectBorder = true,
    this.isCancelBorder = true,
    this.widget,
    this.correctOnPressed,
    this.cancelOnPressed,
  });

  //     : assert(!(!isShowCancel && isHorizontal), 'error'){
  //   isHorizontal = false;
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: _titlePaddingInfo(),
      contentPadding: _contentPaddingInfo(),
      actionsPadding: _actionPaddingInfo(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
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
          _inputWidget(),
        ],
      ),
      actions: <Widget>[
        _buttonsInfo(),
      ],
    );
  }

  Widget _inputWidget() {
    if (widget != null) {
      return widget!;
    }
    return const SizedBox.shrink();
  }

  EdgeInsets _titlePaddingInfo() {
    if (titlePadding != null) {
      return titlePadding!;
    }
    return const EdgeInsets.only(top: 40, left: 45, right: 45);
  }

  EdgeInsets _contentPaddingInfo() {
    if (contentPadding != null) {
      return contentPadding!;
    } else if (title == null) {
      return const EdgeInsets.only(top: 40, bottom: 30, left: 45, right: 45);
    }
    return const EdgeInsets.only(top: 15, bottom: 10, left: 45, right: 45);
  }

  EdgeInsets _actionPaddingInfo() {
    if (actionPadding != null) {
      return actionPadding!;
    } else if (isShowCancel && isHorizontal) {
      return const EdgeInsets.only(bottom: 30, left: 25, right: 25);
    }
    return const EdgeInsets.only(top: 30, bottom: 30, left: 25, right: 25);
  }

  Widget _buttons(String text, Color textColor, Color backgroundColor, bool isBorder, Function()? onPressed, {EdgeInsets? margin}) {
    return Expanded(
      child: Container(
        margin: margin,
        child: EarlyCareButton(
          text: text,
          textColor: textColor,
          fontSize: buttonFontSize,
          isBorder: isBorder,
          radius: radius,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          onPressed: () => onPressed,
        ),
      ),
    );
  }

  Widget _buttonsInfo() {
    if (!isShowCancel) {
      //single confirm button
      return Row(
        children: [
          _buttons(
              correct, correctColor ?? Colors.black, correctBackgroundColor ?? Colors.white, isCorrectBorder, correctOnPressed),
        ],
      );
    }
    if (isShowCancel && isHorizontal) {
      //horizontal confirm button and cancel button
      return Row(
        children: [
          _buttons(cancel, cancelColor ?? Colors.black, cancelBackgroundColor, isCancelBorder, cancelOnPressed),
          _buttons(correct, correctColor ?? ColorInfo.red, correctBackgroundColor ?? Colors.white, isCorrectBorder,
              correctOnPressed),
        ],
      );
    }
    return Column(
      //vertical confirm button and cancel button
      children: [
        Row(
          children: [
            _buttons(correct, correctColor ?? ColorInfo.white, correctBackgroundColor ?? Colors.black, isCorrectBorder,
                correctOnPressed),
          ],
        ),
        Row(
          children: [
            _buttons(cancel, cancelColor ?? ColorInfo.silver, cancelBackgroundColor, isCancelBorder, cancelOnPressed, margin: const EdgeInsets.only(top: 8)),
          ],
        ),
      ],
    );
  }
}
