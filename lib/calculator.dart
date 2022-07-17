void main() {
  String test = '((3+4)+3*4+3+3)';
  List<String> testList = test.split('');
  var holder ;
  print(testList);
  while(testList.contains('(')){
    holder = trimList(testList);
  }

  print(holder.toString());
}

double initCalculate(String str) {

  String result = str;

  String num = '';
  String opr = '';

  int i = 0;
  List<String> list = <String>[];

  for (var element in str.runes) {
    i++;
    String char = String.fromCharCode(element);
//   문자열을  list 로 쪼개서 넘긴다.
    if (isNumeric(char) || char == '.') {
      num = num + char;
    } else {
      list.add(num);
      num = '';
      list.add(char);
    }
    if (i == str.length) {
      list.add(num);
    }
  }

  trimList(list);


  return calculate(multiplyCalculateFirst(list));
}

List<String> trimList(List<String> input) {
  List<String> result = input;
  List<String> holder =[];

  int lastLeft = input.lastIndexOf('(');
  int firstRight = input.indexOf(')');
  // int firstRight = input.sublist(lastLeft).indexOf(')');
  print(input.toString());

  print('firstRgith ) = $firstRight');

  holder = input.sublist(lastLeft+1,firstRight);
  print('holder = $holder');
  List<String> holdingNum = [calculate(holder).toString()];
  result.replaceRange(lastLeft, firstRight+1, holdingNum);
  return result;
}


double calculate(List<String> input) {
  if(input.length==1){
    return double.parse(input[0]);
  }
  List<String> list = multiplyCalculateFirst(input);
  double result = 0.0;
  double a = 0;

  for (int i = 0; i < list.length; i++) {
    if (i == 0) {
      a = double.parse(list[0]);
    }
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
    if(i>0){
      if(input[i-1]=='*'||input[i-1]=='/'||input[i-1]=='%') continue;
    }
    if (input[i] == '*') {
      double holderingNum =
          double.parse(list.last) * double.parse(input[i+1]);
      list.removeLast();
      list.add(holderingNum.toString());
    } else if (input[i] == '/') {
      double holderingNum =
          double.parse(list.last) / double.parse(input[i+1]);
      list.removeLast();
      list.add(holderingNum.toString());

    } else if (input[i] == '%') {
      double holderingNum =
          double.parse(list.last) % double.parse(input[i+1]);
      list.removeLast();
      list.add(holderingNum.toString());
    }
    else{
        list.add(input[i]);
    }
  }
  // print('mlultiplaycalculatefirst=  ' + list.toString());

  return list;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
