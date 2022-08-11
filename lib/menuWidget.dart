import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:simple_calculator/constants.dart';
import 'package:vibration/vibration.dart';
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
              Vibration.vibrate(duration: 50);
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FutureBuilder<List<History>>(
                        future: getList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<History>? historyList = snapshot.data;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: historyList?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 3,
                                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${historyList![index].content} = ',
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            historyList[index].result,
                                            style: const TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                          } else {
                            return Container();
                          }
                        }),
                  ),
                ),
              clearAllButton(),
              ],
            );
          }),
        );
      },
    );
  }

  Future<List<History>> getList() {
    DB data = DB();
    return data.history();
  }

  Widget clearAllButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: kClearBtn,
          onPressed: () {
            Vibration.vibrate(duration: 50);
            DB database = DB();
            database.deleteAllHistory();
            SmartDialog.dismiss();
          },
          child: const Text(
            'Clear All',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
