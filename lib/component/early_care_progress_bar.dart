import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareProgressBar extends StatefulWidget {
  final double? width;
  final double height;
  final double minHeight;
  final double borderRadius;
  final double value;
  final Color color;
  final Color backgroundColor;
  final Widget? titleLeft;
  final Widget? titleRight;

  const EarlyCareProgressBar({
    super.key,
    this.width,
    this.height = 30,
    this.minHeight = 5,
    this.borderRadius = 0,
    this.value = 0,
    this.color = ColorInfo.mainColor,
    this.backgroundColor = ColorInfo.silver,
    this.titleLeft,
    this.titleRight,
  });

  @override
  _EarlyCareProgressBar createState() => _EarlyCareProgressBar();
}

class _EarlyCareProgressBar extends State<EarlyCareProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleInfo(),
              valueInfo(),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            child: LinearProgressIndicator(
              value: widget.value,
              minHeight: widget.minHeight,
              color: widget.color,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleInfo() {
    if (widget.titleLeft != null) {
      return widget.titleLeft!;
    }

    return const SizedBox();
  }

  Widget valueInfo() {
    if (widget.titleRight != null) {
      return widget.titleRight!;
    }

    return const SizedBox();
  }
}
