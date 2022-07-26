import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'inputPage.dart';
import 'package:simple_calculator/resultPage.dart';
import 'menuWidget.dart';
import 'my-globals.dart' as global;
import 'calculator.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print('width = $width Height = $height');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(flex: 3, child: InputPage()),
          Flexible(flex: 2, child: ResultPage()),
          Flexible(
              flex: 1,
              child: MenuWidget(
                buttonPressed: () => setState(() {
                  try {
                    complete();
                  } catch (error) {
                    print('error here!!!!!!!!!');
                  }
                }),
              )),
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Keyboard(
                buttonPressed: () => setState(() {
                  try {
                    complete();
                    print('global result = ${global.resultString}');
                  } catch (error) {
                    print('error here!!!!!!!!!');
                  }
                }),
              ),
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
  print('result = ${result.toString()}');

  global.resultString = result.toString();
}
