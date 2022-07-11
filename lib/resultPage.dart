import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: kInputResultTextPadding,
            child: Text('0.0', style: kResultTextStyle)));
  }
}
