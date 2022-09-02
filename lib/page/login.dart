import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/component/color_info.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  TextPosition textPosition = TextPosition(offset: 10);

  //final controller = TextSelection.fromPosition(10);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController textController = TextEditingController();
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
                //width: double.infinity,
                text: 'TEST',
                onPressed: (){
                  print('a');
                },
              ),


              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  //textAlign: TextAlign.left,

                  decoration: InputDecoration(
                    hintText: "Enter Something", contentPadding: const EdgeInsets.all(20.0),
                    // prefixIcon: Padding(
                    //   padding: EdgeInsetsDirectional.only(top: 30),
                    //   child: Text("jaebal"),
                    // ),


                    // prefixIcon: const Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("jaebal"),
                    // ),



                    suffixIcon: Text("jaebal111", textAlign: TextAlign.end,),
                    //contentPadding: EdgeInsets.only(left: 70),


                    labelText: "asd",
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorInfo.mainColor,
                      //fontSize: 14.0,
                    ),
                 fillColor: Colors.grey,
                 //border: OutlineInputBorder(),
                  ),
                  //focusNode: idFocus,


                  validator: (value)
                  {
                    if(value == null || value.isEmpty)
                    {
                      //idFocus.requestFocus();
                      return "input id";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  onSaved: (value)
                  {
                    //id = value.toString();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
