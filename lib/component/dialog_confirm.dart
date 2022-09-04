import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  final String information;
  final String? correct;
  final String? cancel;
  final Color? correctColor;
  final Color? cancelColor;
  final Color? correctBackgroundColor;
  final Color? cancelBackgroundColor;
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
    this.correctColor,
    this.cancelColor,
    this.correctBackgroundColor,
    this.cancelBackgroundColor,
    this.isHorizontal,
    this.widget,
    this.correctOnPressed,
    this.cancelOnPressed,
  });

  Widget inputWidget()
  {
    if(widget != null)
      {
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
              backgroundColor: cancelBackgroundColor,
              onPressed: cancelOnPressed,

            ),
          ),
          Expanded(
            child: EarlyCareButton(
              text: correct ?? '확인',
              textColor: correctColor,
              backgroundColor: correctBackgroundColor,
              onPressed: correctOnPressed,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Expanded(
          child: EarlyCareButton(
            text: cancel ?? '취소',
            textColor: cancelColor,
            backgroundColor: cancelBackgroundColor,
            onPressed: cancelOnPressed,
          ),
        ),
        Expanded(
          child: EarlyCareButton(
            text: correct ?? '확인',
            textColor: correctColor,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //Dialog Main Title
      title: Column(
        children: <Widget>[
          Text(title),
        ],
      ),
      content: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            information,
          ),

          inputWidget(),
        ],
      ),
      actions: <Widget>[
        buttons(),
        // TextButton(
        //   child: Text("확인"),
        //   onPressed: () {
        //     //Navigator.pop(context);
        //     //Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
        //   },
        // ),
      ],
    );
  }
}
