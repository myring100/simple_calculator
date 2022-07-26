import 'dart:math';

class Calculator {
  double initCalculate(String input) {
    String inputString = input;
    while(!isLeftRightBrasketEqual(input)){
      inputString = '$inputString)';
      if(isLeftRightBrasketEqual(inputString)) break;
   }

    List<String> inputList = stringtoList(inputString);
    List<String> holder = inputList;

    while (inputList.contains('(')) {
      holder = trimList(inputList);
    }
    if (!isNumeric(holder.last)) {
      holder.removeLast();
    }
    if (calculate(multiplyCalculateFirst(holder)) == 0.0) {
      print('result = ${0.0}');
      return 0.0;
    } else {
      print('result = ${calculate(multiplyCalculateFirst(holder))}');

      return double.parse(calculate(multiplyCalculateFirst(holder)).toStringAsFixed(4));
    }
  }
  bool isLeftRightBrasketEqual(String str) {
    bool result;
    String input = str;
    String left = '(';
    String right = ')';

    left.allMatches(input).length == right.allMatches(input).length
        ? result = true
        : result = false;

    return result;
  }

  List<String> stringtoList(String input) {
    String num = '';
    String opr = '';

    List<String> result = <String>[];

    for (var element in input.runes) {
      String char = String.fromCharCode(element);
      if (isNumeric(char) || char == '.') {
        num = num + char;
        if (result.isNotEmpty) {
          if (isNumeric(result.last) || result.last == '.') result.removeLast();
        }
        result.add(num);
      } else {
        num = '';
        result.add(char);
      }
    }

    print('stringtoList = ' + result.toString());

    return result;
  }


  List<String> trimList(List<String> input) {
    List<String> result = input;
    List<String> holder = [];
    int left =0;
    int right = 0;


    if(left==right){
      int lastLeft = input.lastIndexOf('(');
      int firstRight = input.indexOf(')', lastLeft);
      holder = input.sublist(lastLeft + 1, firstRight);

      List<String> holdingNum = [calculate(holder).toString()];
      result.replaceRange(lastLeft, firstRight + 1, holdingNum);
      print('trim() result = ' + result.toString());
    }
    return result;
  }
  double calculate(List<String> input) {
    if (input.length == 1) {
      return double.parse(input[0]);
    }
    List<String> list = multiplyCalculateFirst(input);
    double result = 0.0;
    double a = 0;

    if (list.length == 1) {
      return double.parse(list[0]);
    }

    for (int i = 0; i < list.length; i++) {
      if (i == 0) {
        a = double.parse(list[0]);
      }
      // 연산자가 있을경우.
      if (i % 2 != 0) {
        switch (list[i]) {
          case '+':
            result = a + double.parse(list[i + 1]);
            break;
          case '-':
            result = a - double.parse(list[i + 1]);
            break;
        }
        a = result;
      }
    }
    print('calculate() result = ' + result.toString());
    // return result;
    return result;
  }

  List<String> multiplyCalculateFirst(List<String> input) {
    List<String> list = [];
    for (int i = 0; i < input.length; i++) {
      if (i > 0) {
        if (input[i - 1] == '*' || input[i - 1] == '/' || input[i - 1] == '%')
          continue;
      }
      if (input[i] == '*') {
        double holderingNum =
            double.parse(list.last) * double.parse(input[i + 1]);
        list.removeLast();
        list.add(holderingNum.toString());
      } else if (input[i] == '/') {
        double holderingNum =
            double.parse(list.last) / double.parse(input[i + 1]);
        list.removeLast();
        list.add(holderingNum.toString());
      } else if (input[i] == '%') {
        double holderingNum =
        double.parse(list.last) *  (double.parse(input[i + 1]) / 100);
        list.removeLast();
        list.add(holderingNum.toString());
      } else {
        list.add(input[i]);
      }
    }
    print('multiplyfirst() result = ' + list.toString());

    return list;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
