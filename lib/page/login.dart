import 'package:early_care/component/dialog_confirm.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/textfield_line.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  TextPosition textPosition = TextPosition(offset: 10);

  //final controller = TextSelection.fromPosition(10);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController textController = TextEditingController();
  String text = "ttest";

  void IsValid() {}

  void callDialog()
  {
    showDialog(
        //barrierDismissible: true,
        context: context,
        builder: (BuildContext context)
        {
          return DialogConfirm(
            title: 'title',
            information: 'info',);
        });

  }

  Widget linePrefix() {
    if (text == '') {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 80,
        height: 50,
        color: Colors.greenAccent,
        child: Text(text),
      ),
    );
  }

  Widget lineSuffix() {
    if (text == '') {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 80,
        height: 50,
        color: Colors.greenAccent,
        child: Text(text),
      ),
    );
  }

  BoxConstraints PrefixBoxConstraints() {
    if (text == '') {
      return const BoxConstraints(minHeight: 0, minWidth: 0);
    }
    return const BoxConstraints(minHeight: 0, minWidth: 0);
  }

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
              Row(
                children: [
                  Expanded(
                    child: EarlyCareButton(
                      //width: double.infinity,
                      text: 'TEST',
                      onPressed: () {
                        print('a');
                      },
                    ),
                  ),
                  Expanded(
                    child: EarlyCareButton(
                      //width: double.infinity,
                      text: 'TEST',
                      onPressed: () {
                        print('a');
                      },
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(color: Colors.green),
                  //textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "Enter Something",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: linePrefix(),
                    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                    suffixIcon: lineSuffix(),
                    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                    //alignLabelWithHint: true,

                    fillColor: Colors.grey,
                    //border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      //idFocus.requestFocus();
                      return "input id";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    //id = value.toString();
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextFieldLine(
                  //label: "asd",
                  //labelSize: 50,
                  //labelColor: ColorInfo.mainColor,
                  prefix: "asdasdasd",
                  prefixWidth: 100,
                  hint: "asdasd",
                  fontSize: 30,
                  suffix: "asd",


                  //isUnderline: false,
                ),
              ),

              GestureDetector(
                onTap: ()=>callDialog(),
                child: Container(
                  width: 100,
                  height: 50,
                  child: Text("dialog"),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
