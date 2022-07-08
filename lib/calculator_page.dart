import 'package:flutter/material.dart';
import 'keyboard.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: '0.0',
                hintStyle: TextStyle(fontSize: 25.0),
              ),
            ),
            TextFormField(
              autofocus: true,
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: '0.0',
                hintStyle: TextStyle(fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// enabledBorder: UnderlineInputBorder(
//     borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black)),
// focusedBorder: UnderlineInputBorder(
//     borderSide: BorderSide(color: Colors.black)),