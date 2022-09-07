import 'package:early_care/component/color_info.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCareBottomSheet extends StatelessWidget {
  final Widget title;
  final Widget content;
  final bool? isCancelButton;

  const EarlyCareBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.isCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        cancelInfo(context),
        Padding(
          padding: isCancelButton == true ? const EdgeInsets.fromLTRB(23, 23, 23, 17) : const EdgeInsets.fromLTRB(23, 25, 23, 70),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title,
              content,
            ],
          ),
        ),
      ],
    );
  }

  Widget cancelInfo(BuildContext context) {
    if (isCancelButton == true) {
      return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: SvgPicture.asset(
              Assets.imagesIconCancel,
              width: 17,
              height: 17,
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Container(
        width: 55,
        height: 5,
        decoration: const BoxDecoration(
            //color: Color.fromRGBO(244, 244, 244, 1),
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
