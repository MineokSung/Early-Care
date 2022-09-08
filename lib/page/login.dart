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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Login extends StatefulWidget {
  TextPosition textPosition = const TextPosition(offset: 10);
  String cupertinoResult = 'asd';

  //EarlyCarePicker earlyCarePicker = EarlyCarePicker(data: data, setDataCallbackListener: setDataCallbackListener)
  //final controller = TextSelection.fromPosition(10);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController textController1 = TextEditingController();
  String text = "ttest";
  String cupertino = 'initialize';

  String testCallback = 'false';

  List<MobileCarrier> mobileCarriers = [
    MobileCarrier(id: 1, name: 'SKT'),
    MobileCarrier(id: 2, name: 'KT'),
    MobileCarrier(id: 3, name: 'LG U+'),
    MobileCarrier(id: 4, name: 'SKT 알뜰폰'),
    MobileCarrier(id: 5, name: 'KT 알뜰폰'),
    MobileCarrier(id: 6, name: 'LG U+ 알뜰폰'),
  ];

  DateTime nowInfo = DateTime.now();
  late DateTime previousInfo;
  late DateTime nextInfo;
  int currentDateIndex = 0;
  int currentPage = 0;

  List<String> datesPrevious = [];
  List<String> datesNow = [];
  List<String> datesNext = [];

  @override
  void initState() {
    super.initState();

    previousInfo = DateTime(nowInfo.year, nowInfo.month, nowInfo.day - (7 + nowInfo.weekday));
    nextInfo = DateTime(nowInfo.year, nowInfo.month, nowInfo.day + (7 - nowInfo.weekday));
    currentDateIndex = nowInfo.weekday;
    currentPage = 0;

    datesPrevious = [
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 7))), //sun
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 8))), //mon
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 9))), //tue
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 10))), //wed
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 11))), //thu
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 12))), //fri
      DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 13))), //sat
    ];

    datesNow = [
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 0))), //sun
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 1))), //mon
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 2))), //tue
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 3))), //wed
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 4))), //thu
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 5))), //fri
      DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 6))), //sat
    ];

    datesNext = [
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 7))), //sun
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 8))), //mon
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 9))), //tue
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 10))), //wed
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 11))), //thu
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 12))), //fri
      DateFormat("d").format(nextInfo.subtract(Duration(days: nextInfo.weekday - 13))), //sat
    ];
  }

  List<DateInfo> setDatesNext(DateTime current, bool isNext) {
    DateTime setDateInfo;
    if(isNext){
      setDateInfo = DateTime(current.year, current.month, current.day + (7 - current.weekday));
    }
    else{
      setDateInfo = DateTime(nowInfo.year, nowInfo.month, nowInfo.day - (7 + nowInfo.weekday));
    }

    List<DateInfo> nextDatesInfo = [
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 7)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 7))),), //sun
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 8)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 8))),), //mon
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 9)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 9))),),  //tue
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 10)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 10))),),  //wed
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 11)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 1))),),  //thu
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 12)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 12))),),  //fri
      DateInfo(dateTime: setDateInfo.subtract(Duration(days: setDateInfo.weekday - 13)), date: DateFormat("d").format(setDateInfo.subtract(Duration(days: setDateInfo.weekday - 13))),),  //sat
    ];

    return nextDatesInfo;
  }

  @override
  void dispose() {
    super.dispose();
  }

  dynamic getValue(String result) {
    widget.cupertinoResult = result;
  }

  void buttonActivated() {
    if (textController1.text.length < 2) {
      print("empty");
    } else {
      print("non-empty");
    }
    setState(() {});
  }

  Widget getDate(BuildContext context) {
    DateTime previousInfo = DateTime(nowInfo.year, nowInfo.month, nowInfo.day - (7 + nowInfo.weekday));
    DateTime nextInfo = DateTime(nowInfo.year, nowInfo.month, nowInfo.day + (7 - nowInfo.weekday));
    int currentDateIndex = nowInfo.weekday;
    int currentPage = 0;

    List<DateInfo> datesPrevious = [
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 7)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 7))),), //sun
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 8)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 8))),), //mon
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 9)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 9))),),  //tue
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 10)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 10))),),  //wed
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 11)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 1))),),  //thu
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 12)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 12))),),  //fri
      DateInfo(dateTime: previousInfo.subtract(Duration(days: previousInfo.weekday - 13)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 13))),),  //sat
    ];

    List<DateInfo> datesNow = [
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 0)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 7))),), //sun
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 1)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 8))),), //mon
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 2)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 9))),), //tue
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 3)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 7))),), //wed
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 4)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 8))),), //thu
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 5)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 9))),), //fri
      DateInfo(dateTime: nowInfo.subtract(Duration(days: nowInfo.weekday - 6)), date: DateFormat("d").format(nowInfo.subtract(Duration(days: nowInfo.weekday - 9))),), //sat
    ];

    List<DateInfo> datesNext = [
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 7)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 7))),), //sun
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 8)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 8))),), //mon
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 9)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 9))),),  //tue
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 10)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 10))),),  //wed
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 11)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 1))),),  //thu
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 12)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 12))),),  //fri
      DateInfo(dateTime: nextInfo.subtract(Duration(days: nextInfo.weekday - 13)), date: DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 13))),),  //sat
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('<'),
            ),
            Text(DateFormat("M").format(nowInfo)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('>'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Sun"),
            Text("Mon"),
            Text("Tue"),
            Text("Wed"),
            Text("Thu"),
            Text("Fri"),
            Text("Sat"),
          ],
        ),

        Container(
          height: 50,
          child: PageView.builder(
            //itemCount: null,
            //controller: PageController(initialPage: ),
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              if (index >= currentPage) {//->
                //test
                // List<String> prev = [
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 7))), //sun
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 8))), //mon
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 9))), //tue
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 10))), //wed
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 11))), //thu
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 12))), //fri
                //   DateFormat("d").format(previousInfo.subtract(Duration(days: previousInfo.weekday - 13))), //sat
                // ];
                //
                // List<String> curr = [
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 0))), //sun
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 1))), //mon
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 2))), //tue
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 3))), //wed
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 4))), //thu
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 5))), //fri
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 6))), //sat
                // ];
                //
                // List<String> nex = [
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 7))), //sun
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 8))), //mon
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 9))), //tue
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 10))), //wed
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 11))), //thu
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 12))), //fri
                //   DateFormat("d").format(datesNow[currentDateIndex].subtract(Duration(days: datesNow[currentDateIndex].weekday - 13))), //sat
                // ];
                datesPrevious = datesNow;
                datesNow = datesNext;
                datesNext = setDatesNext(datesNow[currentDateIndex].dateTime, true);
              }

              currentPage = index;
              print('pageChange : $index');
            },
            itemBuilder: (context, index) {
              print('$index');
              return Text('itemBuilder : {$index}');
            },
          ),
        ),
        // Container(
        //   height: 100,
        //   child:
        //     ListView.builder(shrinkWrap: true,
        //         itemCount: dates.length,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Text(dates[index]);
        //         }),
        //
        // ),
      ],
    );
  }

  // BorderSide copyWith({
  //   Color? color,
  //   double? width,
  //   BorderStyle? style,
  // }) {
  //   assert(width == null || width >= 0.0);
  //   return BorderSide(
  //     color: color ?? this.color,
  //     width: width ?? this.width,
  //     style: style ?? this.style,
  //   );
  // }

  Widget activatedButton() {
    if (testCallback == 'false') {
      return EarlyCareButton(
        text: '확인' ?? '취소',
        onPressed: buttonActivated,
      );
    }
    return EarlyCareButton(
      text: '변경' ?? '취소',
      onPressed: buttonActivated,
    );
  }

  void callDialog1() {
    showDialog(
      //barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return EarlyCareDialogConfirm(
            title: 'title',
            isShowCancel: false,
            isHorizontal: true,

            // cancelBackgroundColor: Colors.white,
            // cancelColor: Colors.black,
            // correctBackgroundColor: Colors.white,
            // correctColor: Colors.blue,
            // cancel: 'cancel',
            // correct: 'correct',
            information: 'info',
            //widget: TextFieldLine(),
          );
        });
  }

  void callDialog3() {
    showDialog(
      //barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return const GGAlertDialog(
            body: 'asdasd',
          );
        });
  }

  Widget selectButton(int index) {
    MobileCarrier mobileCarrier = mobileCarriers[index];
    return EarlyCareButton(
      width: double.infinity,
      height: 50,
      backgroundColor: mobileCarrier.isSelected == false ? Colors.white : ColorInfo.mainColor,
      textColor: mobileCarrier.isSelected == false ? Colors.black : Colors.white,
      isBorder: true,
      fontWeight: FontWeight.normal,
      text: mobileCarrier.name,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      onPressed: () {
        setState(() {
          MobileCarrier? beforeSelected = mobileCarriers.firstWhereOrNull((o) => o.isSelected);
          if (beforeSelected != null) {
            beforeSelected.isSelected = false;
          }
          mobileCarrier.isSelected = true;
          Navigator.pop(context);
        });
      },
    );
  }

  void _bottomSheet1() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        builder: (BuildContext context) {
          return EarlyCareBottomSheet(
            isCancelButton: true,
            title: const Text(
              '통신사를 선택해주세요',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(mobileCarriers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: selectButton(index),
                  );
                }),
              ),
            ),
          );
        }).whenComplete(() {
      print('close bottom sheet');
    });
  }

  void deleteText() {
    textController1.clear();
  }

  void callDialog2() {
    showDialog(
      //barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return EarlyCareDialogConfirm(
            title: 'title',
            isShowCancel: true,
            isHorizontal: false,
            correctBackgroundColor: Colors.white,
            correctColor: Colors.blue,
            information: 'info',
            //widget: TextFieldLine(),
          );
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
        //color: Colors.greenAccent,
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
        alignment: Alignment.centerRight,
        width: 80,
        height: 50,
        color: Colors.greenAccent,
        child: Text(text),
      ),
    );
  }

  void testPrint() {
    String testText = 'tttttest';
    print(testText);
  }

  BoxConstraints prefixBoxConstraints() {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //test
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      //width: double.infinity,
                      child: Text('TEST1'),
                      //backgroundColor: Colors.purpleAccent,
                      onPressed: () {
                        String asd = 'asd';
                        print(asd);
                      },
                    ),
                  ),
                  const Expanded(
                    child: EarlyCareButton(
                      //width: 20,
                      text: '확인' ?? '취소',
                      // textColor: Colors.blue,
                      // fontSize: 20,
                      // backgroundColor: Colors.cyan,
                      // onPressed: testPrint,
                    ),
                  ),
                  Expanded(
                    child: EarlyCareButton(
                      //width: double.infinity,
                      text: 'TEST3',
                      onPressed: () {
                        print('a');
                      },
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(color: Colors.green),
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
                margin: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular((10)),
                  ),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.green),
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

                      fillColor: Colors.greenAccent,
                      border: InputBorder.none,
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
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: EarlyCareTextFieldBox(
                  prefix: Text("prefixTouch"),
                  prefixOnTap: testPrint,
                  suffix: Icon(Icons.call),
                  suffixOnTap: deleteText,
                  controller: textController1,
                ),
              ),

              SizedBox(
                //margin: const EdgeInsets.only(top: 30),
                //width: 100,
                height: 30,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "title",
                        ),
                        Text(
                          "value",
                        ),
                      ],
                    ),
                    const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 5,
                        color: Colors.greenAccent,
                        backgroundColor: Colors.grey,
                        semanticsLabel: "start",
                        semanticsValue: 'end',
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const EarlyCareProgressBar(
                  value: (1 / 6) * 2,
                  titleLeft: Text(
                    "titleLeft",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const EarlyCareTextFieldLine(
                  prefix: Text('asdasdasd'),
                  prefixWidth: 100,
                  hint: "asdasd",
                  fontSize: 30,
                  suffix: Text('asdasd'),
                  //isUnderline: false,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const EarlyCareTextFieldLine(
                  width: 130,
                  fontSize: 32,
                  isUnderline: false,
                  textInputAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: EarlyCareTextFieldLine(
                  fontSize: 32,
                  textInputAlign: TextAlign.center,
                  textfieldPadding: const EdgeInsets.symmetric(horizontal: 50),
                  enableBorderColor: Colors.grey,
                  focusBorderColor: ColorInfo.mainColor,
                  hint: '닉네임',
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () => callDialog1(),
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 50,
                    child: const Text("dialogConfirm"),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => callDialog2(),
                child: Container(
                  color: Colors.greenAccent,
                  width: 150,
                  height: 50,
                  child: const Text("dialogNonConfirm"),
                ),
              ),

              GestureDetector(
                onTap: () => callDialog3(),
                child: Container(
                  color: Colors.greenAccent,
                  width: 150,
                  height: 50,
                  child: const Text("dialogNonConfirm"),
                ),
              ),

              Container(
                width: 500,
                height: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(widget.cupertinoResult),
                    Container(
                      width: 300,
                      height: 350,
                      child: EarlyCarePicker(
                        data: ["11", "12", "13", "14", "15", "16", "17", "18", "19"],
                        isHorizontal: true,
                        callback: (val) {
                          print('callbackFunction: $val');
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: EarlyCareTextFieldBox(
                  prefix: Text("prefixTouch222"),
                  prefixOnTap: testPrint,
                  suffix: Icon(Icons.call),
                  suffixOnTap: deleteText,
                  onChanged: (value) {
                    setState(() {
                      testCallback = (value.length > 2).toString();
                    });

                    print(value);
                  },
                  controller: textController1,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: activatedButton(),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () => _bottomSheet1(),
                child: Container(
                  color: Colors.greenAccent,
                  width: 150,
                  height: 50,
                  child: const Text("bottomSheet"),
                ),
              ),

              Container(
                child: getDate(context),
                // child: Column(
                //   children: [
                //     Row(
                //       children: [
                //         ElevatedButton(
                //           child: Text('start'),
                //           onPressed: () {
                //
                //           },
                //
                //         ),
                //         Text('month'),
                //         ElevatedButton(
                //           child: Text('end'),
                //           onPressed: () {
                //
                //           },
                //
                //         ),
                //       ],
                //     ),
                //
                //     Row(
                //
                //     ),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileCarrier {
  int id;
  String name;
  bool isSelected;

  MobileCarrier({required this.id, required this.name, this.isSelected = false});
}

class DateInfo{
  DateTime dateTime;
  String date;

  DateInfo({required this.dateTime, required this.date});
}