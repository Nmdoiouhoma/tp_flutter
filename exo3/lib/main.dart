import 'package:exo3/consts.dart';
import 'package:exo3/services/catapi.dart';
import 'package:flutter/material.dart';
import 'package:exo3/models/breed.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final catAPI = CatAPI();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Breed>> _breeds;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _breeds = widget.catAPI.breeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Expanded(
            child: FutureBuilder(
                future: _breeds,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                        padding: defaultPadding,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          breed:
                          data[index];
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ),
        ]),
      ),
    );
  }
}
