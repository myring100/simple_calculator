import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'my-globals.dart' as globals;
import 'package:toast/toast.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.buttonPressed}) : super(key: key);
  final VoidCallback buttonPressed;

  void complete(){
    globals.resultString = globals.input;
  }

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
        complete();
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
            case '+/-':
            //todo here write some function for +/-
            default:
              if(globals.input == '0'){
                globals.input = input;
              }
              else{
                globals.input = globals.input + input;
              }
          }
          complete();
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
    globals.input = '0';
    globals.resultString = '0';
    print('clear button clicked');
  }

  void brasketTest() {
    String lastChar = globals.input[globals.input.length - 1];
    // List<String> operators = ['(', '%', '/', '*', '+', '-'];
    //마지막 글자가 숫자일때
    if (isNumeric(lastChar)) {
      if (isLeftRightBrasketEqual()) {
        addStringtoInput('*(');
      }
       else {
         addStringtoInput(')');
      }
    }
    //마지막 글자가 숫자가 아닐때 =>> 연산자 일때
    else {
      switch (lastChar) {
        case '+':
          {
            addStringtoInput('(');
            break;
          }
        case '-':
          {
            addStringtoInput('(');
            break;
          }
        case '*':
          {
            addStringtoInput('(');
            break;
          }
        case '/':
          {
            addStringtoInput('(');
            break;
          }
        case '%':
          {
            addStringtoInput('(');
            break;
          }
        case '(':
          {
            addStringtoInput('(');
            break;
          }
        case ')':
          {
            isLeftRightBrasketEqual()? addStringtoInput('*(') : addStringtoInput(')');
            break;
          }
        case '.':
          {
            if( isLeftRightBrasketEqual()){
              deleteLastCharinput();
              addStringtoInput('*(');
            }
            else{
              addStringtoInput(')');
            }
            break;
          }
      }
    }
  }

  void dotTest() {
    String input = globals.input;
    String stringAfterOperator =
    input.split('+').last.split('-').last.split('*').last.split('/').last.split('%').last
    .split('(').last.split(')').last.toString();
    String lastChar = globals.input[globals.input.length - 1];
    switch (lastChar) {
      case '.':
        showToast('Expression Error');
        break;
      case '(':
        addStringtoInput('0.');
        break;
      case ')':
        addStringtoInput('*0.');
        break;
      case '%':
        addStringtoInput('0.');
        break;
      case '/':
        addStringtoInput('0.');
        break;
      case '*':
        addStringtoInput('0.');
        break;
      case '+':
        addStringtoInput('0.');
        break;
      case '-':
        addStringtoInput('0.');
        break;
      default:
        {
          if(stringAfterOperator.contains('.')){
            showToast('Expression Error');
            break;
          }else{
            addStringtoInput('.');
            break;
          }
        }
    }
  }


  //
  void operatorCheck(String str) {
    String lastChar = globals.input[globals.input.length - 1];
    //:todo later us`er type = => push input & result to history and clear input to 0.0
    //:todo  result still contains same result.

    if (lastChar == '.') {
      deleteLastCharinput();
    }
    lastChar = globals.input[globals.input.length - 1];
    if (str == '=') {
    }
    // 마지막 글자가 숫자일때
    // when  lastChar is number
    else if (isNumeric(lastChar)) {
      print('number presssed');
      globals.input = globals.input + str;
    }
    // else if(str=='-'){
    //
    // }
    else {
      // 마지막 글자가 연산자일때 또는 여러가지 에러일떄
      //when last Char is operator or something else errors.
      showToast('Expression Error');
    }
  }

  void addStringtoInput(String str) {
    globals.input = globals.input + str;
  }

  void deleteLastCharinput() {
    globals.input = globals.input.substring(0, globals.input.length - 1);
  }

  bool isLeftRightBrasketEqual() {
    bool result;
    String input = globals.input;
    String left = '(';
    String right = ')';

    left.allMatches(input).length == right.allMatches(input).length
        ? result = true
        : result = false;

    return result;
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

void showToast(String str) {
  Toast.show(str,
      duration: Toast.lengthShort,
      gravity: Toast.bottom,
      textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
      backgroundColor: Colors.black);
}
