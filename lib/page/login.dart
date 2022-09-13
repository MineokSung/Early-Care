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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.imagesIconEarlyCareGreen,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "새로운 과학적 성장관리의 시작",
                    style: TextStyle(
                      color: ColorInfo.mainColor,
                      //fontFamily: Assets.fontsSFPro,
                      fontSize: 20,
                    ),
                  ),
                ),
                const EarlyCareButton(
                  text: "휴대폰 번호로 로그인",
                ),

                EarlyCareButton(
                  text: "지자체로 로그인",
                  textColor: ColorInfo.mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
