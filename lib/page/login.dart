import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorInfo.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //test
              EarlyCareButton(
                width: double.infinity,
                text: 'TEST',
                onPressed: (){
                  print('a');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
