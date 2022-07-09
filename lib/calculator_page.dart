import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'inputPage.dart';
import 'package:simple_calculator/resultPage.dart';
import 'menuWidget.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(flex: 3, child: InputPage()),
          Expanded(flex: 3, child: ResultPage()),
          Expanded(flex :1, child: MenuWidget()),
          Expanded(flex: 10, child: Keyboard()),
        ],
      ),
    );
  }
}

// enabledBorder: UnderlineInputBorder(
//     borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black)),
// focusedBorder: UnderlineInputBorder(
//     borderSide: BorderSide(color: Colors.black)),
