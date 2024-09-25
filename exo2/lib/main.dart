import 'package:exo2/components.dart';
import 'package:exo2/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late double _data1;
  late double _data2;

  _operandValidator(value) {
    if (value == null ||
        value.trim().isEmpty ||
        double.tryParse(value) == null) {
      return 'Veuillez saisir votre nombre';
    }
    return null;
  }

  _displayResult(String operation) {}

  _add() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    _displayResult('$_data1 + $_data2 = ${_data1 + _data2}');
  }

  _sub() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    _displayResult('$_data1 - $_data2 = ${_data1 - _data2}');
  }

  _mul() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    _displayResult('$_data1 * $_data2 = ${_data1 * _data2}');
  }

  _div() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    _displayResult('$_data1  $_data2 / ${_data1 / _data2}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: defaultTextStyle,
                    onSaved: (value) => _data1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Saisir votre operation !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: defaultTextStyle,
                    onSaved: (value) => _data1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Saisir votre operation !';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MySizedBox(
                        child: ElevatedButton(
                      onPressed: () => _add,
                      child: MyText('+'),
                    )),
                    MySizedBox(
                        child: ElevatedButton(
                      onPressed: () => _sub,
                      child: MyText('-'),
                    )),
                    MySizedBox(
                        child: ElevatedButton(
                      onPressed: () => _div,
                      child: MyText('/'),
                    )),
                    MySizedBox(
                        child: ElevatedButton(
                      onPressed: () => _mul,
                      child: MyText('*'),
                    )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
