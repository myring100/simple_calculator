import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'my-globals.dart' as globals;
import 'package:toast/toast.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.buttonPressed}) : super(key: key);
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton('C'),
            numButton('( )'),
            iconButton(CupertinoIcons.percent, '%'),
            iconButton(CupertinoIcons.divide, '/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(7.toString()),
            numButton(8.toString()),
            numButton(9.toString()),
            iconButton(CupertinoIcons.multiply, '*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(4.toString()),
            numButton(5.toString()),
            numButton(6.toString()),
            iconButton(CupertinoIcons.plus, '+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(1.toString()),
            numButton(2.toString()),
            numButton(3.toString()),
            iconButton(CupertinoIcons.minus, '-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton('+/-'.toString()),
            numButton(0.toString()),
            numButton('.'),
            iconButton(CupertinoIcons.equal, '='),
          ],
        ),
      ],
    );
  }

  RawMaterialButton iconButton(IconData icon, String str) {
    return RawMaterialButton(
      onPressed: () {
        operatorCheck(str);
        buttonPressed();
      },
      elevation: 2.0,
      fillColor: kKeyButtonFillColor,
      shape: kKeyButtonShape,
      constraints: kKeyButtonConstraint,
      child: Icon(
        icon,
        size: 45.0,
      ),
    );
  }

  RawMaterialButton numButton(String input) {
    return RawMaterialButton(
        onPressed: () {
          switch (input) {
            case 'C':
              clear();
              break;
            case '( )':
              brasketTest();
              break;
            case '.':
              dotTest();
              break;
            case '+/-' :
              //todo here write some function for +/-
            default:
              globals.input = globals.input + input;
          }
          // if(input == 'C') clear();
          // else if(input == '( )') brasketTest();
          // else if(input=='.') dotTest();
          // else globals.input = globals.input+input;
          buttonPressed();
        },
        elevation: 2.0,
        fillColor: kKeyButtonFillColor,
        shape: kKeyButtonShape,
        constraints: kKeyButtonConstraint,
        child: Text(
          input,
          style: kKeyButtonTextStyle,
        ));
  }

  void clear() {
    globals.input = '';
    globals.result = 0.0;
  }

  void brasketTest() {


  }

  void dotTest() {
    globals.input = '${globals.input}.';


  }

  void operatorCheck(String str) {
    String lastChar = globals.input[globals.input.length - 1];
    //:todo later us`er type = => push input & result to history and clear input to 0.0
    //:todo  result still contains same result.
    // lastChar == '.' ? globals.input= '${globals.input}0' :globals.input = globals.input;

    if(lastChar == '.'){
      globals.input = globals.input.substring(0,globals.input.length-1);

    }
    lastChar = globals.input[globals.input.length - 1];
    if (str == '=') {

    }
    // 마지막 글자가 숫자일때
    // when  lastChar is number
    else if (isNumeric(lastChar)) {
      globals.input = globals.input + str;
    }  else {
      // 마지막 글자가 연산자일때 또는 여러가지 에러일떄
      //when last Char is operator or something else errors.
      Toast.show('Expression Error',
          duration: Toast.lengthShort,
          gravity: Toast.bottom,
          textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
          backgroundColor: Colors.black);
    }
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
