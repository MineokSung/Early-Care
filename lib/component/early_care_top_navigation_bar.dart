import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCareTopNavigationBar extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool isTitleBottom;
  final List<String>? icons;

  const EarlyCareTopNavigationBar({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.isTitleBottom = false,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return _topNavigationBar();
  }

  Widget _title(){
    return Text(
      title,
      textAlign: icons == null || icons!.length == 1 ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
      ),
    );
  }

  Widget _topNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                child: isTitleBottom ? const SizedBox() : _title()),
              _topNavigationBarIcon(),
            ],
          ),
          isTitleBottom ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: _title(),
          ) : const SizedBox(),
        ],
      ),
    );
  }

  Widget _basicBookmarkIcon(){
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.only(right: 14),
      child: SvgPicture.asset(
        Assets.imagesIconBookmark,
      ),
    );
  }

  Widget _topNavigationBarIcon() {
    if(icons == null){
      return Row(
        children: [
          _basicBookmarkIcon(),
        ],
      );
    }
    return Row(
      children: [
        for(int i = 0; i < icons!.length; i++)
          Container(
            padding: const EdgeInsets.all(7),
            margin: i == icons!.length - 1 || !isTitleBottom ? const EdgeInsets.only(right: 8) : null,
            child: SvgPicture.asset(
              icons![i],
            ),
          ),
      ],
    );
  }
}
