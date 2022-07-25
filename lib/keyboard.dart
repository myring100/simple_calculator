import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:simple_calculator/constants.dart';
import 'package:simple_calculator/history.dart';
import 'my-globals.dart' as globals;
import 'package:toast/toast.dart';

import 'db.dart';



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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('C'),
              numButton('( )'),
              iconButton(CupertinoIcons.percent, '%'),
              iconButton(CupertinoIcons.divide, '/'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton(7.toString()),
              numButton(8.toString()),
              numButton(9.toString()),
              iconButton(CupertinoIcons.multiply, '*'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton(4.toString()),
              numButton(5.toString()),
              numButton(6.toString()),
              iconButton(CupertinoIcons.plus, '+'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton(1.toString()),
              numButton(2.toString()),
              numButton(3.toString()),
              iconButton(CupertinoIcons.minus, '-'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('00'.toString()),
              numButton(0.toString()),
              numButton('.'),
              iconButton(CupertinoIcons.equal, '='),
            ],
          ),
        ),
      ],
    );
  }


  Expanded iconButton(IconData icon, String str) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: kKeyboardBTN_padding,
        child: RawMaterialButton(
          onPressed: () async {
            operatorCheck(str);
            //:todo 여기서 = 일때의 일이 벌어진다.
            if(str=='='){
              History history = History(content: globals.input,
              result: globals.resultString);
              var dataBase = DB();
              dataBase.insertHistory(history);
              globals.input = globals.resultString;
              globals.resultString = '0';
            }
            buttonPressed();

          },
          elevation: 2.0,
          fillColor: kKeyButtonFillColor,
          shape: kKeyButtonShape,
          constraints: kKeyButtonConstraint,
          child: Center(
            child: Icon(
              icon,
              size: 45.0,
            ),
          ),
        ),
      ),
    );
  }

  Expanded numButton(String input) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: kKeyboardBTN_padding,
        child: RawMaterialButton(
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
                  }else if(globals.input.endsWith(')')){
                     addStringtoInput('*$input');
                  }

                  else{
                    addStringtoInput(input);
                  }
              }
              buttonPressed();
            },
          elevation: 2.0,
          fillColor: kKeyButtonFillColor,
          shape: kKeyButtonShape,
          constraints: kKeyButtonConstraint,
          child: Center(

              child: Text(
                input,
                style: kKeyButtonTextStyle,
              ),
            ),
        ),
      ),
    );
  }

  void clear() {
    globals.input = '0';
    globals.resultString = '0';
    print('clear button clicked');
  }

  void brasketTest() {
    String lastChar = globals.input[globals.input.length - 1];
    if(globals.input.length==1 && lastChar=='0'){
      addStringtoInput('(');
    }
    //
    // List<String> operators = ['(', '%', '/', '*', '+', '-'];
    //마지막 글자가 숫자일때
   else if (isNumeric(lastChar)) {
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


  //1234
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
    if(globals.input =='0'){
      globals.input = '';
    }
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
