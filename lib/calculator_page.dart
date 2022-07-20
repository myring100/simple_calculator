import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'inputPage.dart';
import 'package:simple_calculator/resultPage.dart';
import 'menuWidget.dart';
import 'my-globals.dart' as global;
import 'calculator.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2, child: InputPage()),
          Expanded(flex: 2, child: ResultPage()),
          Expanded(flex: 1, child: MenuWidget()),
          Expanded(
            flex: 7,
            child: Keyboard(
              buttonPressed: () => setState(() {
                if (global.input != '0'||global.input !='(') {
                  // complete();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

void complete() {
  String input = global.input;
  final calculator = Calculator();
  double result = calculator.initCalculate(input);
  print(result.toString());

  global.resultString = result.toString();
}
