import 'package:flutter/material.dart';

enum ToolTip {
  bottomRight,
  bottomLeft,
  bottomCenter,
  topRight,
  topLeft,
  topCenter,
  right,
  left,
}

class EarlyCareToolTip extends StatelessWidget {
  final String text;
  final ToolTip? direction;
  final Color backgroundColor;

  const EarlyCareToolTip({
    super.key,
    required this.text,
    this.direction,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return _toolTip();
  }

  Widget _toolTip() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: backgroundColor,
      ),
      child: Container(color: Colors.greenAccent,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
