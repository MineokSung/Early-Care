import 'package:early_care/component/color_info.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TopNavigationBarIcon {
  bookmark(1),
  add(2),
  calendarClear(3);

  const TopNavigationBarIcon(this.newIndex);
  final int newIndex;

  //int get newIndex => index+1;
}

extension ExtensionTopNavigationBarIcon on TopNavigationBarIcon {
  int get extensionTopNavigationBarIcon{
    switch(this){
      case TopNavigationBarIcon.bookmark:
        return 1;
      case TopNavigationBarIcon.add:
        return 2;
      case TopNavigationBarIcon.calendarClear:
        return 3;
    }
    return 1;
  }
}

class EarlyCareTopNavigationBar extends StatelessWidget {
  final String title;
  final double? fontSize;
  final bool? isTitleBottom;
  final int? iconCount;

  // final TopNavigationBarIcon? bookmark;
  // final TopNavigationBarIcon? add;
  // final TopNavigationBarIcon? calendarClear;

  const EarlyCareTopNavigationBar({
    super.key,
    required this.title,
    this.fontSize,
    this.isTitleBottom = false,
    // this.bookmark,
    // this.add,
    // this.calendarClear,
    this.iconCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return _topNavigationBar();
  }

  Widget _topNavigationBar() {
    if (!isTitleBottom!) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                Assets.imagesIconLeft,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: iconCount == 1 ? TextAlign.center : TextAlign.left,
                style: TextStyle(
                  fontSize: fontSize ?? 20,
                  color: Colors.black,
                ),
              ),
            ),
            _topNavigationBarIcon(),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  Assets.imagesIconLeft,
                  color: Colors.black,
                ),
              ),
              _topNavigationBarIcon(),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topNavigationBarIcon() {
    if (iconCount == TopNavigationBarIcon.calendarClear.newIndex) {
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            margin: !isTitleBottom! ? const EdgeInsets.only(right: 8) : null,
            child: SvgPicture.asset(
              Assets.imagesIconCalendarClear,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: !isTitleBottom! ? const EdgeInsets.only(right: 8) : null,
            child: SvgPicture.asset(
              Assets.imagesIconAdd,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              Assets.imagesIconBookmark,
            ),
          ),
        ],
      );
    } else if (iconCount == TopNavigationBarIcon.add.newIndex) {
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            margin: !isTitleBottom! ? const EdgeInsets.only(right: 8) : null,
            child: SvgPicture.asset(
              Assets.imagesIconAdd,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              Assets.imagesIconBookmark,
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(right: 8),
          child: SvgPicture.asset(
            Assets.imagesIconBookmark,
          ),
        ),
      ],
    );
  }
}
