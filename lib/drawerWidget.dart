import 'package:counter_7/models/watchlist.dart';
import 'package:flutter/material.dart';
import './main.dart';
import './form.dart';
import './data.dart';
import './mywatchlist.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
      ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BudgetForm()));
          }),
      ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BudgetData()));
          }),
      ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyWatchList()));
          })
    ]));
  }
}
