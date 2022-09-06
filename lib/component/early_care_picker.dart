import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/generated/assets.dart';
import 'package:early_care/page/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarlyCarePicker extends StatefulWidget {
  final double? width;
  final double? height;
  final double? minHeight;
  final double? borderRadius;
  final double? value;
  final Color? color;
  final Color? backgroundColor;
  final Widget? titleLeft;
  final Widget? titleRight;
  final int? initPosition;
  final bool? isHorizontal;
  final List<dynamic> data;
  final Function(String) callback;

  EarlyCarePicker({
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

  Widget selectLine() {
    if (widget.isHorizontal == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RotatedBox(
            //bottom picker image
            quarterTurns: 3,
            child: Container(
              width: 28,
              height: 20,
              margin: EdgeInsets.only(top: 30),
              child: SvgPicture.asset(
                //"${Paths.imagePath}picker_horizontal_bottom.svg",
                Assets.imagesPickerHorizontalTop,
                //"assets/images/picker_horizontal_bottom.svg",
              ),
            ),
          ),
          RotatedBox(
            //top picker image
            quarterTurns: 3,
            child: Container(
              width: 42,
              height: 30,
              margin: EdgeInsets.only(bottom: 30),
              child: SvgPicture.asset(
                  //"${Paths.imagePath}picker_horizontal_bottom.svg",
                  Assets.imagesPickerHorizontalBottom
                  //"assets/images/picker_horizontal_bottom.svg",

                  ),
              //color: ColorInfo.mainColor,
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          height: 2,
          color: ColorInfo.mainColor,
        ),
        Container(
          width: 80,
          height: 2,
          color: ColorInfo.mainColor,
        ),
      ],
    );
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
      selectionOverlay: selectLine(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: widget.isHorizontal! ? 1 : 0,
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

  Widget pickerDirection() {
    if (widget.isHorizontal == true) {
      return RotatedBox(
        quarterTurns: 3,
        child: _picker(),
      );
    }

    return Center(
      child: _picker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return pickerDirection();
  }
}
