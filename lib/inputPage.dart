import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'my-globals.dart' as globals;

class InputPage extends StatefulWidget {

  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: kInputResultTextPadding,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Text(
            globals.input,
            overflow: TextOverflow.clip,
            style: kInputTextStyle,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );

  }
}