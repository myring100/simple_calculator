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
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         
          const Expanded(

            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '0.0',
                style: TextStyle( 
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.end,

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
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
            ),
          ),
          const Expanded(flex: 7, child: Keyboard()),
        ],
      ),
    );
  }
}

// enabledBorder: UnderlineInputBorder(
//     borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black)),
// focusedBorder: UnderlineInputBorder(
//     borderSide: BorderSide(color: Colors.black)),
