import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'calculator_page.dart';
import 'my-globals.dart' as globals;
import 'inputPage.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.buttonPressed}) : super(key: key);
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton('C'),
            numButton('( )'),
            iconButton(CupertinoIcons.percent),
            iconButton(CupertinoIcons.divide),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(7.toString()),
            numButton(8.toString()),
            numButton(9.toString()),
            iconButton(CupertinoIcons.multiply),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(4.toString()),
            numButton(5.toString()),
            numButton(6.toString()),
            iconButton(CupertinoIcons.plus),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton(1.toString()),
            numButton(2.toString()),
            numButton(3.toString()),
            iconButton(CupertinoIcons.minus),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton('+/-'.toString()),
            numButton(0.toString()),
            numButton('.'),
            iconButton(CupertinoIcons.equal),
          ],
        ),
      ],
    );
  }

  RawMaterialButton iconButton(IconData icon) {
    return RawMaterialButton(
      onPressed: () {
        print('hi1')

        buttonPressed;
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
          print('hi1');
           buttonPressed;
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
}
