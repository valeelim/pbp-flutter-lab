import 'package:flutter/material.dart';
import 'globals.dart' as globals;

import './drawerWidget.dart';

class BudgetData extends StatefulWidget {
  const BudgetData({super.key});

  @override
  State<BudgetData> createState() => _BudgetDataState();
}

class _BudgetDataState extends State<BudgetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Budget Data'),
        ),
        drawer: DrawerWidget(),
        body: ListView(children: <Widget>[
          for (var item in globals.itemList)
            Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2)),
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${item.value}'),
                                Text(item.type)
                              ]))
                    ])))
        ]));
  }
}
