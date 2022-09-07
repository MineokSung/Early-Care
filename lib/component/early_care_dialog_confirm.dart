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
  bool isHorizontal;
  bool isShowCancel;
  final bool? isBorder;
  final Widget? widget;
  final Function()? correctOnPressed;
  final Function()? cancelOnPressed;

  EarlyCareDialogConfirm({
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
    this.isHorizontal = false,
    this.isShowCancel = false,
    this.isBorder,
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
      titlePadding: title == null ? EdgeInsets.zero : const EdgeInsets.only(top: 40, left: 45, right: 45),
      contentPadding: contentPaddingInfo(),
      //actionsPadding: actionPadding ?? const EdgeInsets.only(top: 20, bottom: 30, left: 25, right: 25),
      actionsPadding: actionPaddingInfo(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: title == null
          ? null
          : Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: titleColor ?? Colors.black,
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
                  color: informationColor ?? Colors.grey,
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
    return const EdgeInsets.only(top: 15, bottom: 10, left: 45, right: 45);
  }

  EdgeInsets actionPaddingInfo() {
    if (actionPadding != null) {
      return actionPadding!;
    } else if (isShowCancel && isHorizontal == true) {
      return const EdgeInsets.only(bottom: 30, left: 25, right: 25);
    }
    return const EdgeInsets.only(top: 30, bottom: 30, left: 25, right: 25);
  }

  Widget buttonsInfo() {
    if (!isShowCancel) {
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
    if (isShowCancel && isHorizontal == true) {
      //horizontal confirm button and cancel button
      return Row(
        children: [
          Expanded(
            child: EarlyCareButton(
              text: cancel ?? '취소',
              textColor: cancelColor ?? Colors.black,
              fontSize: buttonFontSize,
              backgroundColor: cancelBackgroundColor ?? Colors.white,
              onPressed: () => cancelOnPressed,
            ),
          ),
          Expanded(
            child: EarlyCareButton(
              text: correct ?? '확인',
              textColor: correctColor ?? Colors.red,
              fontSize: buttonFontSize,
              backgroundColor: correctBackgroundColor ?? Colors.white,
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
            text: correct ?? '확인',
            textColor: correctColor ?? Colors.white,
            fontSize: buttonFontSize,
            backgroundColor: correctBackgroundColor ?? Colors.black,
            onPressed: correctOnPressed,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          child: EarlyCareButton(
            width: double.infinity,
            text: cancel ?? '취소',
            textColor: cancelColor ?? Colors.grey,
            fontSize: buttonFontSize,
            backgroundColor: cancelBackgroundColor ?? Colors.white,
            isBorder: true,
            borderColor: Colors.grey,
            onPressed: cancelOnPressed,
          ),
        ),
      ],
    );
  }
}
