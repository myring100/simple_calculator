import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Text(
        '0.0',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
