
void main() {
  String test = '33+33-33*33';

  String num = '';
  String opr = '';

  int i = 1;
  List<String> list = <String>[];

  for (var element in test.runes) {
    print(i);
    i++;
    String char = String.fromCharCode(element);
    if (isNumeric(char) || char == '.') {
      num = num + char;
      if (test.length == i) {
        list.add(num);
      }
    } else {
      list.add(num);
      num = '';
      list.add(char);
    }
  }
  print(calculate(list).toString());
}

double calculate(List<String> input) {
  double result = 0.0;
  double a = 0;

  for (int i = 0; i < input.length; i++) {
    if (i==0){
      a = double.parse(input[0]);
      print('a=$a');
    }
    if (i % 2 != 0) {
      print('here is operator');
      switch (input[i]) {
        case '+': result = a + double.parse(input[i+1]); break;
        case '-': result = a - double.parse(input[i+1]); break;
        case '*': result =  a * double.parse(input[i+1]); break;
        case '/': result = a / double.parse(input[i+1]); break;
        case '%': result = a % double.parse(input[i+1]); break;
      }
      a = result;
    }
  }
  return result;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
//test11