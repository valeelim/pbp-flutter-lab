import './main.dart';
import 'globals.dart' as globals;
import 'form.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

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
        drawer: Drawer(
            child: Column(children: [
          ListTile(
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              }),
          ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BudgetForm()));
              }),
          ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BudgetData()));
              })
        ])),
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
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
