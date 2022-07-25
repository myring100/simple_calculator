import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:simple_calculator/constants.dart';
import 'history.dart';
import 'my-globals.dart' as global;
import 'db.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, required this.buttonPressed}) : super(key: key);
  final VoidCallback buttonPressed;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  String? backdropResult = '';

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
            onPressed: () {
              _showAttach(context);
            },
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
              widget.buttonPressed();
            },
          ),
        ],
      ),
    );
  }

  void _showAttach(BuildContext ctx) {
    //target widget
    SmartDialog.show(
      useSystem: true,
      builder: (_) {
        return Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            return FutureBuilder<List<History>>(
                future: getList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<History>? historyList = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: historyList?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Center(
                            child: Row(
                              children: [
                                Text(historyList![index].content),
                                Text(historyList[index].result)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                });
          }),
        );
      },
    );
  }

  Future<List<History>> getList() {
    DB data = DB();
    return data.history();
  }
}
