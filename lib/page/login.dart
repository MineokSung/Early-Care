import 'package:early_care/component/class/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/class/color_info.dart';

class Login extends StatefulWidget
{
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: ColorInfo.white,
      body: SafeArea(
        child: Column(
          children: [
            Button("first", 30, ColorInfo.mainColor, ColorInfo.white),
            Button("first", 30, ColorInfo.mainColor, ColorInfo.white),
          ],
        ),
      ),
    );
  }
}