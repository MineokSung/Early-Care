import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/generated/assets.dart';
import 'package:early_care/page/login2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCareIcon extends StatefulWidget {
  final String filePath;
  final String? label;
  final bool? isBadge;
  final bool? isActive;
  final int? badgeCount;
  final double? width;
  final double? height;
  final Color? activeColor;

  EarlyCareIcon({
    super.key,
    required this.filePath,
    this.label,
    this.isBadge = false,
    this.isActive = false,
    this.badgeCount,
    this.width,
    this.height,
    this.activeColor = ColorInfo.mainColor,
  });

  @override
  _EarlyCareIcon createState() => _EarlyCareIcon();
}

class _EarlyCareIcon extends State<EarlyCareIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 11,
                left: 27,
                right: 27,
              ),
              //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              // width: widget.width,
              // height: widget.height,

              child: Container(
                child: SvgPicture.asset(
                  widget.filePath,
                  color: widget.isActive! ? widget.activeColor : ColorInfo.silver,
                ),
                //color: widget.isActive! ? widget.activeColor : ColorInfo.silver,
              ),
            ),
            _badgeInfo(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 3),
          child: widget.label == null
              ? null
              : Text(
                  widget.label!,
                  style: TextStyle(
                    fontSize: 10,
                    color: widget.isActive! ? widget.activeColor : ColorInfo.silver,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _badgeInfo() {
    if (!widget.isBadge! && widget.badgeCount == null) {
      return SizedBox();
    } else if (widget.isBadge! && widget.badgeCount != null || !widget.isBadge! && widget.badgeCount != null) {
      return Positioned(
        top: 6,
        right: 23,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "${widget.badgeCount}",
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (widget.isBadge! && widget.badgeCount == null) {
      return Positioned(
        top: 10,
        right: 25,
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
        ),
      );
    }

    return SizedBox();
  }
}
