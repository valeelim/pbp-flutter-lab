import 'package:flutter/services.dart';
import './main.dart';
import './data.dart';
import 'globals.dart' as globals;
import 'package:flutter/material.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({super.key});

  @override
  State<BudgetForm> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  String newItem = "";
  String budgetType = 'Pilih Jenis';
  List<String> budgetTypeList = ['Pilih Jenis', 'Pengeluaran', 'Pemasukan'];
  int nominal = 0;

  var clearTextFields = TextEditingController();
  var clearTextFields2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: Drawer(
          child: Column(children: [
        ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
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
            })
      ])),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: clearTextFields,
                    decoration: InputDecoration(
                        hintText: 'Judul',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (String? value) {
                      setState(() {
                        newItem = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        newItem = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama item tidak boleh kosong!';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: clearTextFields2,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: 'Nominal',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga item tidak boleh kosong!';
                      }
                      return null;
                    }),
              ),
              DropdownButtonFormField<String>(
                  value: budgetType,
                  items: budgetTypeList.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      budgetType = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == 'Pilih Jenis') {
                      return 'Jenis budget tidak boleh kosong!';
                    }
                    return null;
                  }),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          globals.itemList.add(
                              globals.DataModel(newItem, nominal, budgetType));
                          clearTextFields.clear();
                          clearTextFields2.clear();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 10,
                                    child: Container(
                                        child: ListView(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                          Center(
                                              child: const Text(
                                                  'Data telah tersimpan')),
                                          SizedBox(height: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Kembali'),
                                          )
                                        ])));
                              });
                        }
                      }))
            ]),
          ),
        ),
      ),
    );
  }
}
