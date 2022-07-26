import 'package:flutter/material.dart';

const kKeyButtonTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.black,
);
const kMenuBTNColor = Colors.black;
const kKeyboardBTN_padding = EdgeInsets.fromLTRB(5,0,5,0);

const kKeyButtonPadding = EdgeInsets.all(10.0);
const kKeyButtonFillColor = Colors.grey;
const kKeyButtonShape = CircleBorder();
const kKeyButtonConstraint = BoxConstraints(
  minWidth: 36.0,
  minHeight: 36.0,
);

const kInputTextStyle = TextStyle(
  fontSize: 28.0,
  height: 1.4,
  letterSpacing: 1,
);
const kResultTextStyle =
    TextStyle(fontSize: 33.0, height: 1.4, letterSpacing: 1);
const kInputResultTextPadding = EdgeInsets.all(13);




ButtonStyle kClearBtn = ElevatedButton.styleFrom(
  primary: Colors.green,
  onPrimary: Colors.white,
  shadowColor: Colors.greenAccent,
  elevation: 3,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0)),
  minimumSize: const Size(150 , 50), //////// HERE
);
