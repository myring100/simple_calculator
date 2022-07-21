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
          Flexible(flex: 1, child: MenuWidget()),
          Flexible(flex: 7, child: Keyboard(
              buttonPressed: () => setState(() {
                try{
                  complete();
                }catch(error){
                  print('error here!!!!!!!!!');
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
  print('result = ${result.toString()}');

  global.resultString = result.toString();
}
