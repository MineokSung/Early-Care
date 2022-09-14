import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class EarlyCareProgressBar extends StatefulWidget {
  final double? width;
  final double? height;
  final double? minHeight;
  final double? borderRadius;
  final double? value;
  final Color? color;
  final Color? backgroundColor;
  final Widget? titleLeft;
  final Widget? titleRight;

  const EarlyCareProgressBar({
    super.key,
    this.width,
    this.height,
    this.minHeight,
    this.borderRadius,
    this.value,
    this.color,
    this.backgroundColor,
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
      height: widget.height ?? 30,
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
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 0)),
            child: LinearProgressIndicator(
              value: widget.value ?? 0,
              minHeight: widget.minHeight ?? 5,
              color: widget.color ?? ColorInfo.mainColor,
              backgroundColor: widget.backgroundColor ?? Colors.grey,
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
