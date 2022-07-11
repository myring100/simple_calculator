import 'dart:ffi';

import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'inputPage.dart';
import 'package:simple_calculator/resultPage.dart';
import 'menuWidget.dart';



String input = '';
double result = 0.0;


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  // String input = '';
  // double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(flex: 2, child: InputPage()),
          Expanded(flex: 2, child: ResultPage()),
          Expanded(flex :1, child: MenuWidget()),
          Expanded(flex: 7, child: Keyboard()),
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {

  }
}

// enabledBorder: UnderlineInputBorder(
//     borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black)),
// focusedBorder: UnderlineInputBorder(
//     borderSide: BorderSide(color: Colors.black)),
