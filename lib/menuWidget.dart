import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'my-globals.dart' as global;

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key, required this.buttonPressed}) : super(key: key);
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
            icon: const Icon(Icons.history),
            iconSize: 32,
            color: kMenuBTNColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 32,
            color: kMenuBTNColor,
            onPressed: () {
              if (global.input.isEmpty || global.input.length == 1) {
                global.input = '0';
              } else if (global.input.isNotEmpty) {
                global.input =
                    global.input.substring(0, global.input.length - 1);

              }
              buttonPressed();
            },
          ),
        ],
      ),
    );
  }
}
