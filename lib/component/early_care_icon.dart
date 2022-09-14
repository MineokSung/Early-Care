import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCareIcon extends StatefulWidget {
  final String filePath;
  final String? label;
  final bool isBadge;
  final bool isActive;
  final int? badgeCount;
  final double? width;
  final double? height;
  final Color activeColor;

  const EarlyCareIcon({
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
              child: SvgPicture.asset(
                widget.filePath,
                color: widget.isActive ? widget.activeColor : ColorInfo.silver,
              ),
            ),
            _badgeInfo(),
          ],
        ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 5, bottom: 3),
        //   child: widget.label == null ? null : Text(
        //           widget.label!,
        //           style: TextStyle(
        //             fontSize: 10,
        //             color: widget.isActive ? widget.activeColor : ColorInfo.silver,
        //           ),
        //         ),
        // ),

        Visibility(
          visible: widget.label != null,//not null = visible, null = gone
          child: Text(
            widget.label ?? '',
            style: TextStyle(
              fontSize: 10,
              color: widget.isActive ? widget.activeColor : ColorInfo.silver,
            ),
          ),
        ),

      ],
    );
  }

  Widget _badgeCount(double positionedTop, double positionedRight, double size, {Widget? count}) {
    return Positioned(
      top: positionedTop,
      right: positionedRight,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Colors.red,
        ),
        child: count,
      ),
    );
  }

  Widget _badgeInfo() {
    if (!widget.isBadge && widget.badgeCount == null) {
      return const SizedBox();
    } else if (widget.isBadge && widget.badgeCount != null || !widget.isBadge && widget.badgeCount != null) {
      return _badgeCount(6, 23, 12,
        count: Align(
          alignment: Alignment.center,
          child: Text(
            "${widget.badgeCount}",
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else if (widget.isBadge && widget.badgeCount == null) {
      return _badgeCount(10, 25, 8);
    }

    return const SizedBox();
  }
}
