// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lugat/styles/class.dart';

import 'entity/element_card.dart';
import 'styles/styles.dart';

class InOnePage extends StatefulWidget {
  InOnePage({Key? key, required this.labelIndex, required this.index})
      : super(key: key);
  int labelIndex = 0;
  int index = 0;

  @override
  _InOnePageState createState() => _InOnePageState();
}

class _InOnePageState extends State<InOnePage> {
  bool valueSwitch = false;
  bool textOpacity = false;
  List listKeys = ['1'];
  int index = 0;
  List listValues = ['2'];
  var labels = Labels.sample;

  @override
  void initState() {
    setState(() {});
    super.initState();
    listKeysAdd(0);
    listValuesAdd(0);
    listKeys =listKeysAdd(0) as List;
    listValues = listValuesAdd(0) as List;
    final box = Hive.box<ElementCard>('group_box');
    final group = ElementCard(
        keyss: listKeys,
        // Labels.sample[index].mapName.keys.toList()
        //   ..forEach((element) {
        //     listKeys?.add(element);
        //   }),
        value:listValues,
        // Labels.sample[index].mapName.values.toList()
        //   ..forEach((element) {
        //     listKeys?.add(element);
        //   })
  );
    box.add(group);

    // Labels.sample[0].listValuesAdd(0);
    // Labels.sample[0].listKeysAdd(0);

  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ElementCard>('group_box');
    final transaction = box.values.toList().cast<ElementCard>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Labels.sample[widget.labelIndex].label),
        actions: [
          Switch(
            onChanged: (value) => setState(() {
              valueSwitch = value;
              textOpacity = value;
            }),
            value: valueSwitch,
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  height: MediaQuery.of(context).size.height / 3.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          '${transaction.isNotEmpty ? transaction[index].keyss[index] : 'Barcha so`zlar tugadi'}',
                          maxLines: 7,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color:
                              valueSwitch ? Colors.white12 : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () => setState(
                            () => textOpacity = !textOpacity,
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height / 50,
                                  horizontal:
                                      MediaQuery.of(context).size.width / 20),
                              child: Text(
                                '${transaction.isNotEmpty ? transaction[index].value[index] : 'Barcha so`zlar tugadi'}',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textOpacity
                                        ? Colors.white.withOpacity(0.0)
                                        : Colors.white.withOpacity(1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (transaction.isNotEmpty) {
                          if (valueSwitch == true) {
                            textOpacity = true;
                          }
                          index = (index - 1) % transaction[index].value.length;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    style: buttonNavigationStyle,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (labels.isNotEmpty) {
                          if (valueSwitch == true) {
                            textOpacity = true;
                          } else {
                            textOpacity = false;
                          }
                          index = (index + 1) % transaction[index].value.length;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                    style: buttonNavigationStyle,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (transaction[index].keyss.length > 1.5) {
                      transaction[index].keyss.removeAt(index);
                      // transaction[index].keyss.remove(index);
                      transaction[index].value.removeAt(index);
                      // transaction[index].value.remove(index);
                      // labels[widget.index].listValues.remove(index);
                      // labels[widget.index].listKeys.removeAt(index);
                      // labels[widget.index].listKeys.remove(index);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text(
                                    'Tabriklaymiz! Siz barcha so`zlarni yod oldingiz!'),
                              ));
                    }
                  });
                },
                child: const Text('Bilaman'),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.black26)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listValuesAdd(int index) {
    return Labels.sample[index].mapName.values.toList().forEach((element) {
      listValues.add(element);
    });
  }

  listKeysAdd(int index) {
    return Labels.sample[index].mapName.keys.toList().forEach((element) {
      listKeys.add(element);
    });
  }
}
