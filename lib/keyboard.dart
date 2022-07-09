import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          buildKeyRow('C','()','%','%'),
          buildKeyRow('7','8','9','X'),
          buildKeyRow('4','5','6','-'),
          buildKeyRow('1','2','3','+'),
          buildKeyRow('+/-','0','.','='),

        ],
      ),
    );
  }

  Row buildKeyRow(String a, String b, String c,String d) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          numButton(a),
          numButton(b),
          numButton(c),
          numButton(d),

        ],
      );
  }
}

RawMaterialButton numButton(String input) {
  return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.grey[400],
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Text(
        input,
        style: kKeyButtonTextStyle,
      ));
}
