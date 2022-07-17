double initCalculate(String input) {

  List<String> inputList = input.split('');
  List<String> holder =[];
  while (inputList.contains('(')) {
    holder = trimList(inputList);
  }


  return calculate(multiplyCalculateFirst(holder));

      //calculate(multiplyCalculateFirst(holder) >>>>>>>>>>>>>>>>>> 결과값 도출!!!!!!!!!!!!!
}



List<String> trimList(List<String> input) {
  List<String> result = input;
  List<String> holder = [];
  int lastLeft = input.lastIndexOf('(');
  int firstRight = input.indexOf(')', lastLeft);
  holder = input.sublist(lastLeft + 1, firstRight);

  List<String> holdingNum = [calculate(holder).toString()];
  result.replaceRange(lastLeft, firstRight + 1, holdingNum);

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

  return list;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
