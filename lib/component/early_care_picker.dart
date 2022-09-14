import 'package:early_care/component/color_info.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCarePicker extends StatefulWidget {
  final double? width;
  final double? height;
  final Color color;
  final int? initPosition;
  final bool isHorizontal;
  final List<dynamic> data;
  final Function(String) callback;

  const EarlyCarePicker({
    super.key,
    this.width,
    this.height,
    this.color = Colors.black,
    this.initPosition,
    this.isHorizontal = false,
    required this.data,
    required this.callback,
  });

  @override
  _EarlyCarePicker createState() => _EarlyCarePicker();
}

class _EarlyCarePicker extends State<EarlyCarePicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _pickerDirection();
  }

  Widget _pickerDirection() {
    return RotatedBox(
      quarterTurns: widget.isHorizontal ? 3 : 0,
      child: _picker(),
    );
  }

  Widget _pickerHorizontalIcon({
    required double width,
    required double height,
    EdgeInsets? margin,
    String? imagePath = '',
    Color? color,
  }) {
    return RotatedBox(
      //bottom picker image
      quarterTurns: widget.isHorizontal ? -1 : 0,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        color: color,
        child: widget.isHorizontal
            ? SvgPicture.asset(
                imagePath!,
              )
            : null,
      ),
    );
  }

  Widget _selectLine() {
    if (widget.isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _selectLineHorizontalIcons(),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _selectLineVerticalIcons(),
    );
  }

  List<Widget> _selectLineHorizontalIcons() {
    List<Widget> selectLineHorizontal = [
      _pickerHorizontalIcon(
        width: 28,
        height: 20,
        margin: const EdgeInsets.only(top: 30),
        imagePath: Assets.imagesPickerHorizontalTop,
      ),
      _pickerHorizontalIcon(
        width: 42,
        height: 30,
        margin: const EdgeInsets.only(bottom: 30),
        imagePath: Assets.imagesPickerHorizontalBottom,
      ),
    ];
    return selectLineHorizontal;
  }

  List<Widget> _selectLineVerticalIcons() {
    List<Widget> selectLineVertical = [
      _pickerHorizontalIcon(
        width: 80,
        height: 2,
        color: ColorInfo.mainColor,
      ),
      _pickerHorizontalIcon(
        width: 80,
        height: 2,
        color: ColorInfo.mainColor,
      ),
    ];
    return selectLineVertical;
  }

  Widget _picker() {
    return CupertinoPicker.builder(
      diameterRatio: 1,
      itemExtent: 70,
      childCount: widget.data.length,
      scrollController: FixedExtentScrollController(
        initialItem: widget.initPosition ?? (widget.data.length / 2).round(),
      ),
      onSelectedItemChanged: (int value) {
        widget.callback(widget.data[value]);
      },
      selectionOverlay: _selectLine(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: widget.isHorizontal ? 1 : 0,
              child: Center(
                child: Text(
                  widget.data[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
