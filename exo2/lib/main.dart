import 'package:exo2/components.dart';
import 'package:exo2/consts.dart';
import 'package:flutter/material.dart';
import 'package:exo2/page/results.dart';
import 'package:exo2/model/history_entry.dart';
import 'package:exo2/repositories/history_entry.dart';
import 'package:exo2/database.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await historyDatabase().open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final repo = HistoryEntryRepository();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late double _data1;
  late double _data2;
  late FocusNode _op1Focus;
  late Future<List<historyEntry>> _history;
  late final DateFormat _dateTimeFormat;

  String? _operandValidator(value) {
    if (value == null ||
        value.trim().isEmpty ||
        double.tryParse(value) == null) {
      return 'Veuillez saisir votre nombre';
    }
    return null;
  }

  _displayResult(String operation) {
    widget.repo.insert(historyEntry(operation));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResultsPage(operation)))
        .then((value) {
      setState(() {
        _formKey.currentState?.reset();
        _history = widget.repo.getAll();
        _op1Focus.requestFocus();
      });
    });
  }

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
  void initState() {
    super.initState();
    initializeDateFormatting()
        .then((value) => _dateTimeFormat = DateFormat.yMd('fr').add_jm());
    _op1Focus = FocusNode();
    _history = widget.repo.getAll();
  }

  @override
  void dispose() {
    _op1Focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _op1Focus,
                    keyboardType: TextInputType.number,
                    style: defaultTextStyle,
                    onSaved: (value) => _data1 = double.parse(value.toString()),
                    validator: _operandValidator,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _op1Focus,
                    keyboardType: TextInputType.number,
                    style: defaultTextStyle,
                    onSaved: (value) => _data2 = double.parse(value.toString()),
                    validator: _operandValidator,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MySizedBox(
                    child: ElevatedButton(
                  onPressed: () => _add(),
                  child: MyText('+'),
                )),
                MySizedBox(
                    child: ElevatedButton(
                  onPressed: () => _sub(),
                  child: MyText('-'),
                )),
                MySizedBox(
                    child: ElevatedButton(
                  onPressed: () => _div(),
                  child: MyText('/'),
                )),
                MySizedBox(
                    child: ElevatedButton(
                  onPressed: () => _mul(),
                  child: MyText('*'),
                )),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: _history,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ListView.builder(
                          padding: defaultPadding,
                          itemCount: data.length,
                          itemBuilder: (context, index) => MyText(
                              '${_dateTimeFormat.format ?? (data[index].date)} : ${data[index].operation}'));
                    } else {
                      return const Text('chargement...');
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
