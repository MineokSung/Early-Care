import 'dart:core';
import 'package:collection/collection.dart';
import 'package:early_care/component/early_care_bottom_sheet.dart';
import 'package:early_care/component/early_care_dialog_confirm.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_picker.dart';
import 'package:early_care/component/early_care_progress_bar.dart';
import 'package:early_care/component/early_care_textfield_box.dart';
import 'package:early_care/component/early_care_textfield_line.dart';
import 'package:early_care/component/test.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorInfo.mainColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.imagesIconEarlyCareWhite,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "새로운 과학적 성장관리의 시작",
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: Assets.fontsSFPro,
                    fontSize: 20,
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'login');
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: Text("next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
