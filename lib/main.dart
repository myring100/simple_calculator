import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.highContrastDark(),
      ),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      home:
      const CalculatorPage(),
    );
  }
}
