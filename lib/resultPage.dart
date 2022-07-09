import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextFormField(
        autofocus: true,
        readOnly: true,
        textAlign: TextAlign.end,
        decoration: const InputDecoration(
          hintText: '0.0',
          hintStyle: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
