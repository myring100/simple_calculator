import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'my-globals.dart' as globals;

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: kInputResultTextPadding,
        child: Text(
          globals.resultString,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: kResultTextStyle,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
