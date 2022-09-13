import 'dart:core';
import 'package:collection/collection.dart';
import 'package:early_care/component/early_care_bottom_sheet.dart';
import 'package:early_care/component/early_care_dialog_confirm.dart';
import 'package:early_care/component/early_care_button.dart';
import 'package:early_care/component/color_info.dart';
import 'package:early_care/component/early_care_icon.dart';
import 'package:early_care/component/early_care_picker.dart';
import 'package:early_care/component/early_care_progress_bar.dart';
import 'package:early_care/component/early_care_textfield_box.dart';
import 'package:early_care/component/early_care_textfield_line.dart';
import 'package:early_care/component/test.dart';
import 'package:early_care/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Login2 extends StatefulWidget {
  TextPosition textPosition = const TextPosition(offset: 10);
  String cupertinoResult = 'asd';

  //EarlyCarePicker earlyCarePicker = EarlyCarePicker(data: data, setDataCallbackListener: setDataCallbackListener)
  //final controller = TextSelection.fromPosition(10);
  @override
  _Login2 createState() => _Login2();
}

class _Login2 extends State<Login2> {
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
  int currentDateIndex = 0;
  int currentPage = 500;

  List<DateInfo> datesNow = [];

  @override
  void initState() {
    super.initState();

    currentDateIndex = nowInfo.weekday;
    if (currentDateIndex == 7) {
      currentDateIndex = 0;
    }

    datesNow = dateUpdate(nowInfo, currentDateIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DateInfo> setMonth(DateTime current, bool isNext) {
    DateTime setDateInfo;
    int dateTime = current.weekday;
    if (dateTime == 7) {
      dateTime = 0;
    }
    if (isNext) {
      setDateInfo = DateTime(current.year, current.month + 1, current.day);
    } else {
      setDateInfo = DateTime(current.year, current.month - 1, current.day);
    }

    int setDateTime = setDateInfo.weekday;
    if (setDateTime == 7) {
      setDateTime = 0;
    }

    return dateUpdate(setDateInfo, setDateTime);
  }

  List<DateInfo> dateUpdate(DateTime setDateInfo, int dateIndex) {
    List<DateInfo> datesInfo = [
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 0)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 0))),
        day: "S",
      ), //sun
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 1)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 1))),
        day: "M",
      ), //mon
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 2)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 2))),
        day: "T",
      ), //tue
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 3)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 3))),
        day: "W",
      ), //wed
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 4)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 4))),
        day: "T",
      ), //thu
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 5)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 5))),
        day: "F",
      ), //fri
      DateInfo(
        dateTime: setDateInfo.subtract(Duration(days: dateIndex - 6)),
        date: DateFormat("d").format(setDateInfo.subtract(Duration(days: dateIndex - 6))),
        day: "S",
      ), //sat
    ];

    return datesInfo;
  }

  List<DateInfo> setDatesNext(DateTime current, bool isNext) {
    DateTime setDateInfo;
    int dateTime = current.weekday;

    if (dateTime == 7) {
      dateTime = 0;
    }
    if (isNext) {
      setDateInfo = DateTime(current.year, current.month, current.day + 7);
    } else {
      setDateInfo = DateTime(current.year, current.month, current.day - 7);
    }
    int setDateTime = setDateInfo.weekday;
    if (setDateTime == 7) {
      setDateTime = 0;
    }

    return dateUpdate(setDateInfo, setDateTime);
  }

  bool isSelect(int index) {
    if (index == currentDateIndex) {
      return true;
    }
    return false;
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

  Widget getDate() {
    return Container(
      height: 130,
      color: ColorInfo.mainColor,
      //padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print("s");
                    setState(() {
                      datesNow = setMonth(datesNow[currentDateIndex].dateTime, false);
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      Assets.imagesIconLeft,
                    ),
                  ),
                ),
                Text(
                  "${DateFormat("M").format(datesNow[currentDateIndex].dateTime)}월",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      datesNow = setMonth(datesNow[currentDateIndex].dateTime, true);
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20),
                    child: SvgPicture.asset(
                      Assets.imagesIconRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(top: 10),
            child: PageView.builder(
              //itemCount: null,
              controller: PageController(initialPage: currentPage, keepPage: false),
              //allowImplicitScrolling: true,
              //physics: AlwaysScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  if (index > currentPage) {
                    //->
                    datesNow = setDatesNext(datesNow[currentDateIndex].dateTime, true);
                  } else {
                    //<-
                    datesNow = setDatesNext(datesNow[currentDateIndex].dateTime, false);
                  }
                  currentPage = index;
                });
                print('pageChange : $index');
              },
              //itemCount: null,
              // children: [
              //   Container(
              //     child: prev(datesNow),
              //   ),
              //   Container(
              //     child: curr(datesNow),
              //   ),
              //   Container(
              //     child: next(datesNow),
              //   ),
              // ],
              itemBuilder: (context, index) {
                //print('$index');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 7; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentDateIndex = i;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: isSelect(i) ? Colors.white : ColorInfo.mainColor,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  datesNow[i].day,
                                  style: TextStyle(
                                    color: ColorInfo.calendarDayColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Text(
                                  datesNow[i].date,
                                  style: TextStyle(
                                    color: isSelect(i) ? ColorInfo.calendarDayColor : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
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
        isPlus: true,
        mainAxisAlignment: MainAxisAlignment.center,
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
      mainAxisAlignment: MainAxisAlignment.start,
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
          padding: const EdgeInsets.symmetric(vertical: 16),
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
                      isPlus: true,
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
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: EarlyCareTextFieldBox(
                  prefix: Text("prefixTouch"),
                  //prefixOnTap: testPrint,
                  //suffix: Icon(Icons.call),
                  suffix: Text("suffix"),
                  label: "asdasd",
                  width: 300,
                  helperText: "helper",
                  boxBorderRadius: 5,boxColor: Colors.white,
                  enableBorderColor: Colors.blue,
                  //suffixOnTap: deleteText,
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
                  //prefix: Text('asdasdasd'),
                  prefixWidth: 100,
                  hint: "asdasd",
                  fontSize: 30,
                  textPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  //suffix: Text('asdasd'),
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

              // Container(
              //   margin: const EdgeInsets.only(top: 30),
              //   child: EarlyCareTextFieldBox(
              //     prefix: Text("prefixTouch222"),
              //     prefixOnTap: testPrint,
              //     suffix: Icon(Icons.call),
              //     suffixOnTap: deleteText,
              //     label: "label",
              //     onChanged: (value) {
              //       setState(() {
              //         testCallback = (value.length > 2).toString();
              //       });
              //
              //       print(value);
              //     },
              //     controller: textController1,
              //   ),
              // ),

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
                child: getDate(),
              ),

              // EarlyCareIcon(
              //   isBadge: true,
              //   //badgeCount: 5,
              //   widget: SvgPicture.asset(
              //     Assets.imagesIconCart,
              //   ),
              // ),

              Container(
                child: GestureDetector(
                  onTap: (){
                    print("icon");
                  },
                  child: EarlyCareIcon(
                    isBadge: true,
                    badgeCount: 5,
                    isActive: true,
                    filePath: Assets.imagesIconCart,
                  ),
                ),
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

class DateInfo {
  DateTime dateTime;
  String date;
  String day;

  DateInfo({required this.dateTime, required this.date, required this.day});
}
