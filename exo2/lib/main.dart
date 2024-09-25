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
      theme: ThemeData(
      ),
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
  String _name = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text(widget.title)
      ),

      body: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                Padding(
                  padding: null,
                  child: TextFormField(

                    decoration: const InputDecoration(labelText: 'Votre nom'),
                    onSaved: (value) => _name = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                  ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: [],
                        child: Text('Dire Bonjour'),
                      ),
                    ),


                ),


                Padding(
                  padding: null,
                  child: TextFormField(

                    decoration: const InputDecoration(labelText: 'Votre nom'),
                    onSaved: (value) => _name = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                  ),

                ),
                ],

              ),
            ],

        ),
      ),
    );
  }

