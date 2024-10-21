import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.grey),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: kHintColor),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFirstColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFirstColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kTextDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
  border:
  Border.all(color: kFirstColor, width: 1.0),
);

final kTextDecoration2 = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(16.0)),
  border:
  Border.all(color: kFirstColor, width: 1.0),
);

const kDropdownFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFirstColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kFirstColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

// const kSpinkitDoubleBounce = SpinKitDoubleBounce(
//   color: kFirstColor,
//   size: 50.0,
// );

// final slider = SleekCircularSlider(
//   appearance: CircularSliderAppearance(
//       customWidths: CustomSliderWidths(progressBarWidth: 10)),
//   min: 0000,
//   max: 9999,
//   initialValue: 0100,
// );


const Color kLoginBtnColor = Colors.blueAccent;
const Color kRegisterBtnColor = Colors.lightBlueAccent;
const Color kHintColor = Colors.grey;

const Color kFirstColor = Color(0xFFECA83B);
const Color kSecondColor = Color(0xFFFDEBC3);
const Color kThirdColor = Color(0xFF4A2A2D);
const Color kFourthColor = Color(0xFFE49934);
const Color kFifthColor = Color(0xFFC47827);
const Color kTextBlackColor = Colors.black;
const Color kTextWhiteColor = Colors.white;
const Color kBgWhiteColor = Colors.white;
const Color kBgBlackColor = Colors.black;

