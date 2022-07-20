class Calculator {
  double initCalculate(String input) {
    print('first input = $input');
    List<String> inputList = stringtoList(input);
    print('first inputlist = $inputList');

    List<String> holder = inputList;
    while (inputList.contains('(')) {
      holder = trimList(inputList);
    }
    //:todo holder의 마지막 인덱스가 숫자가 아니면 remove last!
    if(!isNumeric(holder.last)){
      holder.removeLast();
    }
    print('holder value = $holder');
    print('initcalcualte result = ' +
        calculate(multiplyCalculateFirst(holder)).toString());
    return calculate(multiplyCalculateFirst(holder));
  }

  List<String> stringtoList(String input) {
    String num = '';
    String opr = '';

    List<String> result = <String>[];

    for (var element in input.runes) {
      String char = String.fromCharCode(element);
      if (isNumeric(char) || char == '.') {
        print('here is number added');
        num = num + char;
        if (result.isNotEmpty){
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
    int lastLeft = input.lastIndexOf('(');
    int firstRight = input.indexOf(')', lastLeft);
    holder = input.sublist(lastLeft + 1, firstRight);

    List<String> holdingNum = [calculate(holder).toString()];
    result.replaceRange(lastLeft, firstRight + 1, holdingNum);
    print('trim() result = ' + result.toString());

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
            double.parse(list.last) % double.parse(input[i + 1]);
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
